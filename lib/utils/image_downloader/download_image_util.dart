import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

/// Platform-aware image downloader.
Future<String> downloadImage({XFile? pickedFile, String? imageSource}) async {
  try {
    // 🔹 Handle Web platform separately
    if (kIsWeb) return 'Download not supported on Web yet.';

    Uint8List? bytes;

    // 🔸 1. From picked file
    if (pickedFile != null) {
      bytes = await pickedFile.readAsBytes();
    }

    // 🔸 2. From image URL
    if (bytes == null && imageSource != null) {
      final response = await http.get(Uri.parse(imageSource));
      if (response.statusCode == 200) {
        bytes = response.bodyBytes;
      }
    }

    if (bytes == null) return 'No image data to save.';

    // 🔸 3. Request permission (Android)
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      return 'Storage permission denied.';
    }

    // 🔸 4. Save image
    final result = await ImageGallerySaver.saveImage(bytes);
    final success =
        result['isSuccess'] == true || result['isSuccess'] == 'true';

    return success ? 'Image saved to gallery.' : 'Failed to save image.';
  } catch (e) {
    return 'Error saving image: $e';
  }
}
