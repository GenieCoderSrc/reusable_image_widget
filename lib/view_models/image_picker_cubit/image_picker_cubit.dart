import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/utils/comprass_image.dart';
import 'package:reusable_image_widget/utils/crop_image.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<File?> {
  ImagePickerCubit() : super(null);

  final ImagePicker _picker = ImagePicker();

  onPickImage({
    required ImageSource imageSource,
    required BuildContext context,
    double? maxHeight,
    double? maxWidth,
    int? imageQuality,
  }) async {
    try {
      XFile? pickedFile = await _picker.pickImage(
        source: imageSource,
        maxWidth: maxHeight,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      if (pickedFile != null) {
        pickedFile = (await cropImage(
          pickedFile: pickedFile,
          context: context,
        ));

        pickedFile = await compressImage(
          pickedFile,
          quality: imageQuality ?? 100,
        );

        File image = File(pickedFile.path);

        emit(image);
      }
    } catch (e) {
      debugPrint('ImagePickerCubit | onPickImage | error: $e');
    }
  }

  clear() => emit(null);
}
