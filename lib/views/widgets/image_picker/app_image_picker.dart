import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/core/typedefs.dart';
import 'package:reusable_image_widget/view_models/image_picker_cubit/image_picker_cubit.dart';

import '../app_image_viewer.dart';
import 'app_image_picker_error_widget.dart';
import 'image_source_selector.dart';

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
            onChanged?.call(state.pickedFile);
          }
        },
        builder: (context, state) {
          if (state is ImagePickerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ImagePickerFailure) {
            return AppImagePickerErrorWidget(
              message: state.message,
              onRetry: () => _handleTap(context),
            );
          }

          if (state is ImagePickerSuccess) {
            return builder != null
                ? builder!(state.pickedFile)
                : AppImageViewer(
                  pickedFile: state.pickedFile,
                  imageSource: initialImageSource,
                );
          }

          // Initial state
          return builder != null
              ? builder!(null)
              : AppImageViewer(
                pickedFile: null,
                imageSource: initialImageSource,
              );
        },
      ),
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
    showModalBottomSheet(
      context: context,
      builder:
          (_) => ImageSourceSelector(
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
