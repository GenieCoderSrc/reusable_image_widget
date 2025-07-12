import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/extensions/image_source_type_checker.dart';

class AppImageResolver {
  /// Resolves and returns an appropriate image widget from:
  /// - Picked File (XFile)
  /// - Network Image
  /// - Asset Image
  /// Falls back to error widget if all fail.
  Widget resolveImage({
    XFile? pickedFile,
    String? imageSource,
    double? scale,
    BoxFit? fit,
    double? width,
    double? height,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    try {
      if (_isPickedFileValid(pickedFile)) {
        return _buildFromPickedFile(
          file: pickedFile!,
          fit: fit,
          scale: scale,
          width: width,
          height: height,
          errorWidget: errorWidget,
        );
      }

      if (_isNetworkUrl(imageSource)) {
        return _buildFromNetwork(
          url: imageSource!,
          fit: fit,
          width: width,
          height: height,
          placeholder: placeholder,
          errorWidget: errorWidget,
        );
      }

      if (_isAssetPath(imageSource)) {
        return _buildFromAsset(
          path: imageSource!,
          fit: fit,
          scale: scale,
          width: width,
          height: height,
          errorWidget: errorWidget,
        );
      }

      return errorWidget ?? _defaultError();
    } catch (e) {
      debugPrint('AppImageResolver | Error: $e');
      return errorWidget ?? _defaultError();
    }
  }

  // ─────────────────────────────────────────────────────────────────────────────

  bool _isPickedFileValid(XFile? file) => file != null && file.path.isNotEmpty;

  bool _isNetworkUrl(String? url) =>
      url != null && Uri.tryParse(url)?.isAbsolute == true;

  bool _isAssetPath(String? path) =>
      path != null && path.isNotEmpty && path.isAssetPath;

  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildFromPickedFile({
    required XFile file,
    BoxFit? fit,
    double? scale,
    double? width,
    double? height,
    Widget? errorWidget,
  }) {
    if (kIsWeb) {
      return Image.network(
        file.path,
        fit: fit ?? BoxFit.cover,
        scale: scale ?? 1.0,
        width: width,
        height: height,
        errorBuilder: _errorBuilder(errorWidget),
      );
    } else {
      return Image.file(
        File(file.path),
        fit: fit,
        scale: scale ?? 1.0,
        width: width,
        height: height,
        errorBuilder: _errorBuilder(errorWidget),
      );
    }
  }

  Widget _buildFromNetwork({
    required String url,
    BoxFit? fit,
    double? width,
    double? height,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      width: width,
      height: height,
      placeholder: (_, _) => placeholder ?? _defaultLoading(),
      errorWidget: (_, _, _) => errorWidget ?? _defaultError(),
    );
  }

  Widget _buildFromAsset({
    required String path,
    BoxFit? fit,
    double? scale,
    double? width,
    double? height,
    Widget? errorWidget,
  }) {
    return Image.asset(
      path,
      fit: fit,
      scale: scale ?? 1.0,
      width: width,
      height: height,
      errorBuilder: _errorBuilder(errorWidget),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────

  Widget Function(BuildContext, Object, StackTrace?) _errorBuilder(
    Widget? errorWidget,
  ) {
    return (_, _, _) => errorWidget ?? _defaultError();
  }

  Widget _defaultError() => const Icon(Icons.broken_image, size: 40);

  Widget _defaultLoading() => const Center(child: CircularProgressIndicator());
}
