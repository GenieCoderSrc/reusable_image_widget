import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage({
    required ImageSource source,
    int? imageQuality,
    double? maxHeight,
    double? maxWidth,
  }) async {
    try {
      final XFile? file = await _picker.pickImage(
        source: source,
        imageQuality: imageQuality,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      );

      if (file == null) return file;
      // if (file == null) return (null, null);

      // if (kIsWeb) {
      //   return (null, await file.readAsBytes());
      // } else {
      //   return (File(file.path), null);
      // }
    } catch (e) {
      debugPrint('AppImagePickerService | error: $e');
      return null;
    }
  }
}
