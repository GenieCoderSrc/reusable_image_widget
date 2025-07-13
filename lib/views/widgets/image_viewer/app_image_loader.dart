import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

/// Builds image widget from either picked file or image source
class AppImageLoader extends StatelessWidget {
  const AppImageLoader({
    super.key,
    this.imageSource,
    this.pickedFile,
    this.scale,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.width,
    this.height,
  });

  final String? imageSource;
  final XFile? pickedFile;
  final double? scale;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppImageResolver().resolveImage(
      pickedFile: pickedFile,
      imageSource: imageSource,
      scale: scale,
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
      placeholder: placeholder,
      errorWidget: errorWidget,
    );
  }
}
