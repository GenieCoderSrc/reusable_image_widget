import 'dart:io';

import 'package:flutter/material.dart';

import 'app_image_picker.dart';
import 'avatar_image_viewer.dart';

class AvatarImagePicker extends StatelessWidget {
  const AvatarImagePicker(
      {super.key,
      this.imageSource,
      this.onChanged,
      this.child,
      this.imageQuality = 85,
      this.maxHeight = 500,
      this.maxWidth = 500,
      this.cameraEnabled = true,
      this.galleryEnabled = true});

  final String? imageSource;
  final Function? onChanged;
  final Function? child;
  final int? imageQuality;
  final double? maxHeight;
  final double? maxWidth;
  final bool cameraEnabled;
  final bool galleryEnabled;

  @override
  Widget build(BuildContext context) {
    return AppImagePicker(
      imageQuality: imageQuality,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      child: (File? img) =>
          AvatarImageViewer(image: img, imageSource: imageSource),
      onChanged: onChanged,
      cameraEnabled: cameraEnabled,
      galleryEnabled: galleryEnabled,
    );
  }
}
