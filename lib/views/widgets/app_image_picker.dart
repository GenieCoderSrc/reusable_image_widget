import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_bottom_sheet/bottom_sheet.dart';
import 'package:reusable_image_widget/core/typedefs.dart';
import 'package:reusable_image_widget/view_models/image_picker_cubit/image_picker_cubit.dart';

import 'app_image_viewer.dart';
import 'image_source_selector.dart';

/// General purpose image picker widget with cropping, compressing, loading & error handling.
class AppImagePicker extends StatelessWidget {
  const AppImagePicker({
    super.key,
    this.initialImageSource,
    this.imageQuality = 35,
    this.maxHeight,
    this.maxWidth,
    this.crop = false,
    this.compress = false,
    this.builder,
    this.onChanged,
    this.cameraEnabled = true,
    this.galleryEnabled = true,
  });

  final String? initialImageSource;
  final WidgetImageDataCallback? builder;
  final VoidImageDataCallback? onChanged;

  final int imageQuality;
  final double? maxHeight;
  final double? maxWidth;
  final bool crop;
  final bool compress;

  final bool cameraEnabled;
  final bool galleryEnabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleTap(context),
      child: BlocConsumer<ImagePickerCubit, ImagePickerState>(
        listener: (context, state) {
          if (state is ImagePickerSuccess) {
            onChanged?.call(state.file, state.bytes);
          }
        },
        builder: (context, state) {
          if (state is ImagePickerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ImagePickerFailure) {
            return _buildErrorWidget(context, state.message);
          }

          if (state is ImagePickerSuccess) {
            return _buildChild(context, state.file, state.bytes);
          }

          // Initial state
          return _buildChild(context, null, null);
        },
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, String message) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.error_outline, color: Colors.red, size: 40),
        const SizedBox(height: 8),
        Text(message, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () => _handleTap(context),
          icon: const Icon(Icons.refresh),
          label: const Text('Retry'),
        ),
      ],
    );
  }

  Widget _buildChild(BuildContext context, File? file, Uint8List? bytes) {
    if (builder != null) {
      return builder!(file, bytes);
    }

    return AppImageViewer(
      imageFile: file,
      imageBytes: bytes,
      imageSource: initialImageSource,
    );
  }

  void _handleTap(BuildContext context) {
    final cubit = context.read<ImagePickerCubit>();

    if (cameraEnabled && galleryEnabled) {
      _showSourceSelector(context, cubit);
    } else {
      cubit.onPickImage(
        context: context,
        source: ImageSource.gallery,
        crop: crop,
        compress: compress,
        quality: imageQuality,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      );
    }
  }

  void _showSourceSelector(BuildContext context, ImagePickerCubit cubit) {
    customBottomSheet(
      context: context,
      child: ImageSourceSelector(
        onTap: (ImageSource source) {
          Navigator.pop(context);
          cubit.onPickImage(
            context: context,
            source: source,
            crop: crop,
            compress: compress,
            quality: imageQuality,
            maxHeight: maxHeight,
            maxWidth: maxWidth,
          );
        },
      ),
    );
  }
}
