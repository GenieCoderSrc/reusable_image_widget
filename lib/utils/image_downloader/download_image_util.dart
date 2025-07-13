import 'package:cross_file/cross_file.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

/// Cross-platform image downloader and saver.
Future<String> downloadImage({XFile? pickedFile, String? imageSource}) async {
  try {
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
      } else {
        return 'Failed to download image from URL.';
      }
    }

    if (bytes == null) return 'No image data to save.';

    // 🔸 3. Save image to platform-specific location
    final fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.png';

    if (kIsWeb) {
      // ✅ Web platform
      await FileSaver.instance.saveFile(
        name: fileName,
        bytes: bytes,
        fileExtension: 'png',
        mimeType: MimeType.png,
      );
      return 'Image downloaded successfully (Web).';
    } else if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      // ✅ Mobile platforms
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        return 'Storage permission denied.';
      }

      final result = await ImageGallerySaver.saveImage(bytes);
      final success =
          result['isSuccess'] == true || result['isSuccess'] == 'true';
      return success ? 'Image saved to gallery.' : 'Failed to save image.';
    } else {
      // ✅ Desktop platforms
      await FileSaver.instance.saveFile(
        name: fileName,
        bytes: bytes,
        fileExtension: 'png',
        mimeType: MimeType.png,
      );
      return 'Image saved successfully (Desktop).';
    }
  } catch (e) {
    return 'Error saving image: $e';
  }
}

