import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;

import 'i_services/i_image_compressor_service.dart';

class AppImageCompressorService implements IImageCompressorService {
  @override
  Future<XFile> compressImage(XFile file, {int quality = 35}) async {
    try {
      final String tempDir = (await getTemporaryDirectory()).path;
      final String targetPath = p.join(
        tempDir,
        '${DateTime.now().millisecondsSinceEpoch}${p.extension(file.path)}',
      );

      final XFile? compressed = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetPath,
        quality: quality,
      );

      debugPrint(
        'Compress: original=${await file.length()} compressed=${await compressed?.length()}',
      );

      return compressed ?? file;
    } catch (e) {
      debugPrint('AppImageCompressorService | error: $e');
      return file;
    }
  }

  Future<Directory> getTemporaryDirectory() async {
    return Directory.systemTemp;
  }
}
