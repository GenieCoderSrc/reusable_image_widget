import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/constants/default_image_path.dart';
import 'package:reusable_image_widget/utils/image_provider/app_image_resolver.dart';

class AppImageViewer extends StatelessWidget {
  const AppImageViewer({
    super.key,
    this.imageSource,
    this.imageFile,
    this.imageBytes,
    this.scale,
    this.fit = BoxFit.cover,
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
  final File? imageFile;
  final Uint8List? imageBytes;
  final double? scale;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? width;
  final double? height;

  /// Use uniform border radius (in logical pixels)
  final double? borderRadius;

  /// If true, renders image inside a circle
  final bool isCircular;

  /// Background color used when image fails or is loading
  final Color? backgroundColor;

  final Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    final Widget imageWidget = AppImageResolver().resolveImage(
      imageSource: imageSource ?? kProfileIconPath,
      imageFile: imageFile,
      imageBytes: imageBytes,
      scale: scale,
      fit: fit,
      width: width,
      height: height,
      placeholder: placeholder,
      errorWidget: errorWidget,
    );

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
      child: imageWidget,
    );
  }
}
