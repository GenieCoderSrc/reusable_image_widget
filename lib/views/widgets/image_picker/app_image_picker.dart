import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/extensions/xfile_parser_extension.dart';
import 'package:reusable_image_widget/view_models/image_picker_cubit/image_picker_cubit.dart';

import '../image_viewer/app_image_viewer.dart';
import 'image_source_selector.dart';

class AppImagePicker<T> extends StatelessWidget {
  const AppImagePicker({
    super.key,
    this.imageSource,
    this.imageQuality = 35,
    this.maxHeight,
    this.maxWidth,
    this.crop = false,
    this.compress = false,
    this.builder,
    this.onChanged,
    this.cameraEnabled = true,
    this.galleryEnabled = true,
    this.autoResetOnPop = true, // ✅ New toggle
  });

  final String? imageSource;
  final Widget? builder;
  final void Function(T? file)? onChanged;

  final int imageQuality;
  final double? maxHeight;
  final double? maxWidth;
  final bool crop;
  final bool compress;

  final bool cameraEnabled;
  final bool galleryEnabled;

  final bool autoResetOnPop; // ✅ Optional toggle

  @override
  Widget build(BuildContext context) {
    Widget content = InkWell(
      onTap: () => _handleTap(context),
      child: BlocListener<ImagePickerCubit, ImagePickerState>(
        listener: (context, state) async {
          if (state is ImagePickerSuccess && state.pickedFile != null) {
            final parsed = await state.pickedFile!.parseAs<T>();
            onChanged?.call(parsed);
          }
        },
        child: builder ?? AppImageViewer(imageSource: imageSource),
      ),
    );

    // ✅ Wrap with WillPopScope if autoReset is enabled
    if (autoResetOnPop) {
      content = PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) async {
          context.read<ImagePickerCubit>().clear();
        },
        child: content,
      );
    }

    return content;
  }

  void _handleTap(BuildContext context) {
    if (cameraEnabled && galleryEnabled) {
      _showSourceSelector(context);
    } else {
      pickImage(context: context, source: ImageSource.gallery);
    }
  }

  void _showSourceSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => ImageSourceSelector(
            onTap: (ImageSource source) {
              Navigator.pop(context);
              pickImage(context: context, source: source);
            },
          ),
    );
  }

  void pickImage({
    required BuildContext context,
    ImageSource source = ImageSource.gallery,
  }) {
    final cubit = context.read<ImagePickerCubit>();
    cubit.onPickImage(
      context: context,
      mounted: () => context.mounted,
      source: source,
      crop: crop,
      compress: compress,
      quality: imageQuality,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}
