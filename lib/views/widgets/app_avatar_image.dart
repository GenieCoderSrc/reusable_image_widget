import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'app_image_viewer.dart';

class AppAvatarImage extends StatelessWidget {
  const AppAvatarImage({
    super.key,
    this.imageSource,
    this.imageFile,
    this.imageBytes,
    this.radius = 40,
    this.borderRadius,
    this.isCircular = true,
    this.backgroundColor,
    this.placeholderIcon = Icons.person,
  });

  final String? imageSource;
  final File? imageFile;
  final Uint8List? imageBytes;
  final double radius;
  final double? borderRadius;
  final bool isCircular;
  final Color? backgroundColor;
  final IconData placeholderIcon;

  @override
  Widget build(BuildContext context) {
    return AppImageViewer(
      imageSource: imageSource,
      imageFile: imageFile,
      imageBytes: imageBytes,
      isCircular: isCircular,
      width: radius * 2,
      height: radius * 2,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      placeholder: Icon(placeholderIcon, size: radius),
      errorWidget: Icon(placeholderIcon, size: radius),
    );
  }
}
