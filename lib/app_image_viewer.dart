import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/utils/image_source_type_checker.dart';

Widget? appImageViewer({
  final File? imageFile,
  final double? scale,
  final String? imageSource,
  final BoxFit? fit,
}) {
  try {
    debugPrint(
        'AppImageViewer | appImageViewer | imageSource: $imageSource imageFile: $imageFile');

    if (imageFile != null) {
      return Image.file(imageFile);
    } else {
      // Check whether it's a URL or an asset path

      if (imageSource != null) {
        if (Uri.parse(imageSource).isAbsolute) {
          // It's a URL
          return CachedNetworkImage(
            imageUrl: imageSource,
            fit: fit ?? BoxFit.fill,
            errorWidget: (context, url, error) => Container(
              color: Colors.grey,
              child: const Icon(Icons.error),
            ),
          );
        } else if (imageSource.isAssetPath) {
          // Check if it's an asset path
          return Image.asset(imageSource);
        }
      }
    }
    return null;
  } catch (e) {
    debugPrint('appImageViewer | error: $e');
    return null;
  }
}
