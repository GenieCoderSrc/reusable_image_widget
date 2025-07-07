import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
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
      XFile? pickedFile = await pickerService.pickImage(
        source: source,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: quality,
      );

      if (pickedFile != null) {
        if (crop) {
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

        emit(ImagePickerSuccess(pickedFile: pickedFile));
      }
    } catch (e) {
      emit(ImagePickerFailure('Failed to pick image: $e'));
    }
  }

  void clear() => emit(ImagePickerInitial());
}
