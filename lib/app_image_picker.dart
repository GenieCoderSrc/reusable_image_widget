import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_bottom_sheet/bottom_sheet.dart';
import 'package:reusable_image_widget/view_models_image_picker/image_picker_cubit.dart';

import 'app_circle_avatar.dart';
import 'image_source_selector.dart';

class AppImagePicker extends StatelessWidget {
  final String? imageSource;
  final Function? onChanged;
  final Function? child;
  final int? imageQuality;
  final double? maxHeight;
  final double? maxWidth;
  final bool cameraEnabled;
  final bool galleryEnabled;


  const AppImagePicker({
    super.key,
    this.imageSource,
    this.onChanged,
    this.child,
    this.imageQuality,
    this.maxHeight,
    this.maxWidth,
    this.cameraEnabled = true,
    this.galleryEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ImagePickerCubit>().clear();
    return InkWell(
      onTap: () => cameraEnabled
          ? _selectImageSource(context)
          : getImageFromGallery(context),
      child: BlocBuilder<ImagePickerCubit, File?>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, image) {
          onChanged?.call(image);
          return child != null
              ? child!(image) as Widget
              : _defaultChild(image: image);
        },
      ),
    );
  }

  Future<void> getImageFromGallery(BuildContext context) {
    return context.read<ImagePickerCubit>().onPickImage(
          imageSource: ImageSource.gallery,
          context: context,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: imageQuality,
        );
  }

  // Bottom sheet image picker for choosing image source (e.g., gallery, camera)
  void _selectImageSource(BuildContext context) {
    return customBottomSheet(
      context: context,
      child: ImageSourceSelector(onTap: (imageSource) {
        Navigator.pop(context);
        context.read<ImagePickerCubit>().onPickImage(
              imageSource: imageSource,
              context: context,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: imageQuality,
            );
      }),
    );
  }

  Widget _defaultChild({File? image}) =>
      AppCircleAvatar(img: image, imageSource: imageSource);
}
