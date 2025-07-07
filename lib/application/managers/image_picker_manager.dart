import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

typedef MountedCheck = bool Function();

class ImagePickerManager {
  final AppImagePickerService pickerService;
  final IImageCropperService cropperService;
  final IImageCompressorService compressorService;

  ImagePickerManager({
    required this.pickerService,
    required this.cropperService,
    required this.compressorService,
  });

  /// Picks an image from the given [source], optionally crops and compresses it.
  /// Uses [mounted] callback to avoid context misuse after async gaps.
  Future<XFile?> pickImage({
    required BuildContext context,
    required MountedCheck mounted,
    required ImageSource source,
    bool crop = false,
    bool compress = false,
    int quality = 35,
    double? maxHeight,
    double? maxWidth,
  }) async {
    try {
      XFile? pickedFile = await pickerService.pickImage(
        source: source,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: quality,
      );

      if (pickedFile == null) return null;
      if (crop && mounted()) {
        pickedFile = await cropperService.cropImage(
          pickedFile: pickedFile,
          context: context,
        );
      }

      if (compress) {
        pickedFile = await compressorService.compressImage(
          pickedFile,
          quality: quality,
        );
      }

      return pickedFile;
    } catch (e) {
      debugPrint('ImagePickerHandler | pickImage failed: $e');
      return null;
    }
  }
}
