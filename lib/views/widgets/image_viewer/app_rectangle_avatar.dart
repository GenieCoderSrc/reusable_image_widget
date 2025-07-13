import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';

import 'app_image_viewer.dart';

class AppRectangleAvatar extends StatelessWidget {
  const AppRectangleAvatar({
    super.key,
    this.imageSource,
    this.pickedFile,
    this.height,
    this.width,
    this.radius = 12.0,
    this.placeholderIcon = Icons.image,
    this.backgroundColor,
    this.fit = BoxFit.cover,
  });

  final String? imageSource;
  final XFile? pickedFile;
  final double? height;
  final double? width;
  final double radius;
  final IconData placeholderIcon;
  final Color? backgroundColor;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return AppImageViewer(
      imageSource: imageSource,
      pickedFile: pickedFile,
      width: width,
      height: height,
      borderRadius: radius,
      isCircular: false,
      fit: fit,
      backgroundColor: backgroundColor,
      placeholder: Icon(placeholderIcon),
      errorWidget: Icon(placeholderIcon),
    );
  }
}
