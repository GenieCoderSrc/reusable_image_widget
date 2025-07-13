import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';

import 'app_image_loader.dart';

class AppImageViewer extends StatelessWidget {
  const AppImageViewer({
    super.key,
    this.imageSource,
    this.pickedFile,
    this.scale,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.width,
    this.height,
    this.borderRadius,
    this.clipBehavior = Clip.antiAlias,
    this.isCircular = false,
    this.backgroundColor,
  });

  final String? imageSource;
  final XFile? pickedFile;

  final double? scale;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool isCircular;
  final Color? backgroundColor;
  final Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade300,
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
            isCircular
                ? null
                : (borderRadius != null
                    ? BorderRadius.circular(borderRadius!)
                    : null),
      ),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: AppImageLoader(
        imageSource: imageSource,
        pickedFile: pickedFile,
        scale: scale,
        fit: fit,
        width: width,
        height: height,
        placeholder: placeholder,
        errorWidget: errorWidget,
      ),
    );
  }
}
