import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/utils/image_source_type_checker.dart';

ImageProvider? appImageProvider({
  final File? imageFile,
  final double? scale,
  final String? imageSource,
}) {
  try {
    debugPrint(
        'appImageProvider | imageSource: $imageSource imageFile: $imageFile');

    if (imageFile != null) {
      return FileImage(imageFile);
    } else if (imageSource != null) {
      if (Uri.parse(imageSource).isAbsolute) {
        debugPrint('AppImageProvider | appImageProvider | network image');
        return CachedNetworkImageProvider(
          imageSource,
          scale: scale ?? 1.0,
          errorListener: (Object error) => debugPrint(
              'CachedNetworkImageProvider | Failed to load image from $imageSource | \nerror: ${error.toString()}'),
        );
      } else if (imageSource.isAssetPath) {
        debugPrint('AppImageProvider | appImageProvider | asset image');
        return AssetImage(imageSource);
      }
    }
    return null;
  } catch (e) {
    debugPrint('appImageViewer | error: $e');
    return null;
  }
}
