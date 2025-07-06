import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:reusable_image_widget/services/app_image_compressor_service.dart';
import 'package:reusable_image_widget/services/app_image_cropper_service.dart';
import 'package:reusable_image_widget/services/app_image_picker_service.dart';
import 'package:reusable_image_widget/services/i_services/i_image_compressor_service.dart';
import 'package:reusable_image_widget/services/i_services/i_image_cropper_service.dart';
import 'package:reusable_image_widget/view_models/image_picker_cubit/image_picker_cubit.dart';

void registerReusableImageWidgetDependencies() {
  // --- Services ---
  sl.registerLazySingleton<AppImagePickerService>(
    () => AppImagePickerService(),
  );
  sl.registerLazySingleton<IImageCropperService>(
    () => AppImageCropperService(),
  );
  sl.registerLazySingleton<IImageCompressorService>(
    () => AppImageCompressorService(),
  );

  // --- Cubit ---
  sl.registerFactory(
    () => ImagePickerCubit(
      pickerService: sl<AppImagePickerService>(),
      cropperService: sl<IImageCropperService>(),
      compressorService: sl<IImageCompressorService>(),
    ),
  );
}
