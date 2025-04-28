import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;

Future<XFile> compressImage(XFile file, {int quality = 35}) async {
  try {
    debugPrint('compressImage | path: ${file.path}');
    final String targetPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(file.path)}');
    final XFile? compressedFile =
        (await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      quality: quality,
    ));

    debugPrint(
        'compressImage | before compress length: ${file.length()} After compress length:  ${compressedFile?.length()}');

    return compressedFile ?? file;
  } catch (e) {
    debugPrint('compressImage | error: $e');
    return file;
  }
}

Future<Directory> getTemporaryDirectory() async {
  return Directory.systemTemp;
}
