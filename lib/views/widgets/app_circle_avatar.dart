import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'app_image_viewer.dart';

// app_circle_avatar.dart
class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    this.imageSource,
    this.imageFile,
    this.imageBytes,
    this.radius = 40,
    this.placeholderIcon = Icons.person,
    this.backgroundColor,
  });

  final String? imageSource;
  final File? imageFile;
  final Uint8List? imageBytes;
  final double radius;
  final IconData placeholderIcon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppImageViewer(
      imageSource: imageSource,
      imageFile: imageFile,
      imageBytes: imageBytes,
      width: radius * 2,
      height: radius * 2,
      isCircular: true,
      backgroundColor: backgroundColor,
      placeholder: Icon(placeholderIcon, size: radius),
      errorWidget: Icon(placeholderIcon, size: radius),
    );
  }
}
