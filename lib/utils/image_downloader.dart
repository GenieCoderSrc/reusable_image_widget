import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> downloadImage({
  File? file,
  Uint8List? imageBytes,
  String? imageSource,
}) async {
  try {
    Uint8List? bytes;

    if (kIsWeb) {
      return 'Download not supported on Web yet.';
    }

    // Determine bytes
    if (imageBytes != null) {
      bytes = imageBytes;
    } else if (file != null) {
      bytes = await file.readAsBytes();
    } else if (imageSource != null) {
      final response = await http.get(Uri.parse(imageSource));
      if (response.statusCode == 200) {
        bytes = response.bodyBytes;
      }
    }

    if (bytes == null) return 'No image data to save.';

    final status = await Permission.storage.request();
    if (!status.isGranted) {
      return 'Storage permission denied.';
    }

    final result = await ImageGallerySaver.saveImage(bytes);
    return result['isSuccess'] == true
        ? 'Image saved to gallery.'
        : 'Failed to save image.';
  } catch (e) {
    return 'Error saving image: $e';
  }
}
