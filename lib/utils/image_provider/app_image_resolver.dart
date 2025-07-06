// File: lib/services/app_image_resolver.dart
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/extensions/image_source_type_checker.dart';

// Renamed: appImageViewer to AppImageResolver
class AppImageResolver {
  Widget resolveImage({
    File? imageFile,
    Uint8List? imageBytes,
    String? imageSource,
    double? scale,
    BoxFit fit = BoxFit.cover,
    double? width,
    double? height,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    try {
      if (kIsWeb && imageBytes != null) {
        return Image.memory(
          imageBytes,
          fit: fit,
          scale: scale ?? 1.0,
          width: width,
          height: height,
          errorBuilder: _errorBuilder(errorWidget),
        );
      }

      if (!kIsWeb && imageFile != null) {
        return Image.file(
          imageFile,
          fit: fit,
          scale: scale ?? 1.0,
          width: width,
          height: height,
          errorBuilder: _errorBuilder(errorWidget),
        );
      }

      if (imageSource != null &&
          Uri.tryParse(imageSource)?.isAbsolute == true) {
        return CachedNetworkImage(
          imageUrl: imageSource,
          fit: fit,
          width: width,
          height: height,
          placeholder: (_, __) => placeholder ?? _defaultLoading(),
          errorWidget: (_, __, ___) => errorWidget ?? _defaultError(),
        );
      }

      if (imageSource != null && imageSource.isAssetPath) {
        return Image.asset(
          imageSource,
          fit: fit,
          scale: scale ?? 1.0,
          width: width,
          height: height,
          errorBuilder: _errorBuilder(errorWidget),
        );
      }

      return errorWidget ?? _defaultError();
    } catch (e) {
      debugPrint('AppImageResolver | error: $e');
      return errorWidget ?? _defaultError();
    }
  }

  Widget Function(BuildContext context, Object error, StackTrace? stackTrace)
  _errorBuilder(Widget? errorWidget) {
    return (BuildContext context, Object error, StackTrace? stackTrace) {
      return errorWidget ?? _defaultError();
    };
  }

  Widget _defaultError() => const Icon(Icons.broken_image, size: 40);

  Widget _defaultLoading() => const Center(child: CircularProgressIndicator());
}
