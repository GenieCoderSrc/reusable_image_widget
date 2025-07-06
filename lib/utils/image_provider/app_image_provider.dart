// File: lib/views/widgets/app_image_provider.dart
import 'dart:io' show File;
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/extensions/image_source_type_checker.dart';

ImageProvider<Object>? appImageProvider({
  String? imageSource,
  File? imageFile,
  Uint8List? imageBytes,
  double? scale,
}) {
  try {
    debugPrint(
      'appImageProvider | imageSource: $imageSource | file: $imageFile | bytes: ${imageBytes != null} | scale: $scale',
    );

    // Web support: MemoryImage
    if (kIsWeb && imageBytes != null) {
      return MemoryImage(imageBytes, scale: scale ?? 1.0);
    }

    // FileImage (native only)
    if (!kIsWeb && imageFile != null) {
      return FileImage(imageFile, scale: scale ?? 1.0);
    }

    // Network image
    if (imageSource != null && Uri.tryParse(imageSource)?.isAbsolute == true) {
      return CachedNetworkImageProvider(
        imageSource,
        scale: scale ?? 1.0,
        errorListener:
            (error) => debugPrint(
              'appImageProvider | CachedNetworkImageProvider | Failed to load $imageSource | error: $error',
            ),
      );
    }

    // Asset image
    if (imageSource != null && imageSource.isAssetPath) {
      return AssetImage(imageSource, bundle: null, package: null);
    }

    return null;
  } catch (e) {
    debugPrint('appImageProvider | Exception: $e');
    return null;
  }
}
