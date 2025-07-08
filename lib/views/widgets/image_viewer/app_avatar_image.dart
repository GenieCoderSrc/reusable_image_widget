import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'app_image_viewer.dart';

class AppAvatarImage extends StatelessWidget {
  const AppAvatarImage({
    super.key,
    this.imageSource,
    // this.pickedFile,
    this.radius = 40,
    this.borderRadius,
    this.isCircular = true,
    this.backgroundColor,
    this.placeholderIcon = Icons.person,
  });

  final String? imageSource;
  // final XFile? pickedFile;
  final double radius;
  final double? borderRadius;
  final bool isCircular;
  final Color? backgroundColor;
  final IconData placeholderIcon;

  @override
  Widget build(BuildContext context) {
    return AppImageViewer(
      imageSource: imageSource,
      // pickedFile: pickedFile,
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
