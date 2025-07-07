import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/extensions/image_source_type_checker.dart';

class AppImageResolver {
  /// Resolves an image from picked file, network URL, or asset.
  Widget resolveImage({
    XFile? pickedFile,
    String? imageSource,
    double? scale,
    BoxFit fit = BoxFit.cover,
    double? width,
    double? height,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    try {
      // Case 1: Picked File (Web)
      if (kIsWeb && pickedFile != null) {
        return Image.network(
          pickedFile.path,
          fit: fit,
          scale: scale ?? 1.0,
          width: width,
          height: height,
          errorBuilder: _errorBuilder(errorWidget),
        );
      }

      // Case 2: Picked File (Native)
      if (!kIsWeb && pickedFile != null) {
        return Image.file(
          File(pickedFile.path),
          fit: fit,
          scale: scale ?? 1.0,
          width: width,
          height: height,
          errorBuilder: _errorBuilder(errorWidget),
        );
      }

      // Case 3: Network Image
      if (imageSource != null &&
          Uri.tryParse(imageSource)?.isAbsolute == true) {
        return CachedNetworkImage(
          imageUrl: imageSource,
          fit: fit,
          width: width,
          height: height,
          placeholder: (_, _) => placeholder ?? _defaultLoading(),
          errorWidget: (_, _, _) => errorWidget ?? _defaultError(),
        );
      }

      // Case 4: Asset Image
      if (imageSource != null &&
          imageSource.isNotEmpty &&
          imageSource.isAssetPath) {
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
      debugPrint('AppImageResolver | Error: $e');
      return errorWidget ?? _defaultError();
    }
  }

  Widget Function(BuildContext, Object, StackTrace?) _errorBuilder(
    Widget? errorWidget,
  ) {
    return (_, __, ___) => errorWidget ?? _defaultError();
  }

  Widget _defaultError() => const Icon(Icons.broken_image, size: 40);

  Widget _defaultLoading() => const Center(child: CircularProgressIndicator());
}
