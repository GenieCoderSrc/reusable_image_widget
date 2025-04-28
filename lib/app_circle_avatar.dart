import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reusable_image_widget/app_image_provider.dart';

class AppCircleAvatar extends StatelessWidget {
  final File? img;
  final String? imageSource;
  final Color? backgroundColor;
  final double? radius;
  final double? scale;

  const AppCircleAvatar(
      {super.key,
      this.img,
      this.imageSource,
      this.backgroundColor,
      this.radius,
      this.scale});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 50,
      backgroundColor: backgroundColor ?? Colors.red,
      foregroundColor: backgroundColor ?? Colors.green,
      backgroundImage: appImageProvider(
          imageSource: imageSource, imageFile: img, scale: scale),

      // child: BuildAvatarImage(
      //   imageSource: imageSource,
      //   img: img,
      // ), // Placeholder icon if no image is provided
    );
  }
}
