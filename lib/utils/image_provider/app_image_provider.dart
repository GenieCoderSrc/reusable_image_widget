// File: lib/views/widgets/app_image_provider.dart
import 'dart:io' show File;
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/extensions/image_source_type_checker.dart';

ImageProvider<Object>? appImageProvider({
  String? imageSource,
  XFile? pickedFile,
  double? scale,
}) {
  try {
    debugPrint(
      'appImageProvider | imageSource: $imageSource | pickedFile: $pickedFile | scale: $scale',
    );

    // Web: Use MemoryImage with bytes
    if (kIsWeb && pickedFile != null) {
      return NetworkImage(pickedFile.path);
    }

    // Mobile/Desktop: Use FileImage
    if (!kIsWeb && pickedFile != null) {
      return FileImage(File(pickedFile.path), scale: scale ?? 1.0);
    }

    // Network Image
    if (imageSource != null && Uri.tryParse(imageSource)?.isAbsolute == true) {
      return CachedNetworkImageProvider(imageSource, scale: scale ?? 1.0);
    }

    // Asset Image
    if (imageSource != null && imageSource.isAssetPath) {
      return AssetImage(imageSource);
    }

    // Fallback
    return null;
  } catch (e) {
    debugPrint('appImageProvider | Exception: $e');
    return null;
  }
}
