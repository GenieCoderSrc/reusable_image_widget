import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/views/widgets/image_viewer/app_circle_avatar.dart';
import 'package:reusable_image_widget/views/widgets/image_viewer/app_rectangle_avatar.dart';

/// A unified avatar widget that renders either a circular or rectangular avatar
/// based on [isCircle] flag. Designed to be highly reusable and customizable.
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.isCircle = true,
    this.imageSource,
    this.pickedFile,
    this.placeholderIcon,
    this.backgroundColor,
    this.radius = 40.0,
    this.height,
    this.width,
    this.fit,
  });

  final bool isCircle;

  // Shared between both avatar shapes
  final String? imageSource;
  final XFile? pickedFile;
  final IconData? placeholderIcon;
  final Color? backgroundColor;

  // Circle-specific
  final double radius;

  // Rectangle-specific
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (isCircle) {
      return AppCircleAvatar(
        imageSource: imageSource,
        pickedFile: pickedFile,
        radius: radius,
        placeholderIcon: placeholderIcon ?? Icons.person,
        backgroundColor: backgroundColor,
      );
    } else {
      return AppRectangleAvatar(
        imageSource: imageSource,
        pickedFile: pickedFile,
        height: height,
        width: width,
        radius: radius,
        placeholderIcon: placeholderIcon ?? Icons.image,
        backgroundColor: backgroundColor,
        fit: fit ?? BoxFit.cover,
      );
    }
  }
}
