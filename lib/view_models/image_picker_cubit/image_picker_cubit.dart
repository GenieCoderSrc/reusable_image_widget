import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/services/app_image_picker_service.dart';
import 'package:reusable_image_widget/services/i_services/i_image_compressor_service.dart';
import 'package:reusable_image_widget/services/i_services/i_image_cropper_service.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  final AppImagePickerService pickerService;
  final IImageCropperService cropperService;
  final IImageCompressorService compressorService;

  ImagePickerCubit({
    required this.pickerService,
    required this.cropperService,
    required this.compressorService,
  }) : super(ImagePickerInitial());

  Future<void> onPickImage({
    required BuildContext context,
    required ImageSource source,
    bool crop = false,
    bool compress = false,
    int quality = 35,
    double? maxHeight,
    double? maxWidth,
  }) async {
    emit(ImagePickerLoading());

    try {
      final (file, bytes) = await pickerService.pickImage(
        source: source,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: quality,
      );

      if (!kIsWeb && file != null) {
        XFile xfile = XFile(file.path);

        if (crop) {
          xfile = await cropperService.cropImage(
            pickedFile: xfile,
            context: context,
          );
        }

        if (compress) {
          xfile = await compressorService.compressImage(
            xfile,
            quality: quality,
          );
        }

        emit(ImagePickerSuccess(file: File(xfile.path)));
      } else {
        emit(ImagePickerSuccess(bytes: bytes));
      }
    } catch (e) {
      emit(ImagePickerFailure('Failed to pick image: $e'));
    }
  }

  void clear() => emit(ImagePickerInitial());
}
