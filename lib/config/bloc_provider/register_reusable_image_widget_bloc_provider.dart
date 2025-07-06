import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:provider/single_child_widget.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

// ---- Reusable ImageWidget ------

// late ImageCrudCubit _imageCrudCubit;
late ImagePickerCubit _imagePickerCubit;

void initReusableImageWidgetBlocProvider() {
  // ---- Reusable ImageWidget Init ------
  // _imageCrudCubit = sl<ImageCrudCubit>();
  _imagePickerCubit = sl<ImagePickerCubit>();
}

void disposeReusableImageWidgetBlocProvider() {
  // ---- Reusable ImageWidget Dispose ------
  // _imageCrudCubit.close();
  _imagePickerCubit.close();
}

List<SingleChildWidget> reusableImageWidgetBlocProviders = [
  // ---- Reusable ImageWidget Bloc Provider ------
  // BlocProvider<ImageCrudCubit>(create: (_) => _imageCrudCubit),
  BlocProvider<ImagePickerCubit>(create: (_) => _imagePickerCubit),
];
