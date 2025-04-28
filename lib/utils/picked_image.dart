import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage(
    {required ImageSource source,
    int? imageQuality,
    double? maxHeight,
    double? maxWidth}) async {
  try {
    final ImagePicker picker = ImagePicker();
    return await picker.pickImage(
      source: source,
      maxHeight: maxHeight,
      maxWidth: maxHeight,
      imageQuality: imageQuality,
    );
  } catch (e) {
    debugPrint('PickedImage | pickImage | error: $e');
    return null;
  }
}
