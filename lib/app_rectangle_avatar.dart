import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reusable_image_widget/app_image_provider.dart';

class AppRectangleAvatar extends StatelessWidget {
  const AppRectangleAvatar(
      {super.key,
      this.img,
      this.imageSource,
      this.backgroundColor,
      this.height,
      this.width,
      this.borderRadius,
      this.bottomRadius,
      this.topRadius,
      this.scale,
      this.fit});

  final File? img;
  final String? imageSource;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? bottomRadius;
  final double? topRadius;
  final double? scale;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final imageProvider = appImageProvider(
        imageSource: imageSource, imageFile: img, scale: scale);

    if (imageProvider != null) {
      return SizedBox(
        height: height,
        width: width ?? height,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: bottomRadius != null
                ? BorderRadius.vertical(
                    bottom: Radius.circular(bottomRadius ?? 15),
                  )
                : topRadius != null
                    ? BorderRadius.vertical(
                        top: Radius.circular(topRadius ?? 15),
                      )
                    : BorderRadius.circular(borderRadius ?? 15),
            color: backgroundColor,
            image: DecorationImage(
              fit: fit ?? BoxFit.fill,
              image: imageProvider,
              // scale: scale ?? 20,
            ),
          ),
          // height: height ?? 5000,
          // width: width ?? height ?? 5000,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        color: backgroundColor,
      ),
      height: height,
      width: width,
    );
  }
}
