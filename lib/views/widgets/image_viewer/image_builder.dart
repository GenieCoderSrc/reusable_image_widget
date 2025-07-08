import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

/// Builds image widget from either picked file or image source
class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    super.key,
    this.imageSource,
    this.scale,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.width,
    this.height,
  });

  final String? imageSource;
  final double? scale;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickerCubit, ImagePickerState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final pickedFile =
            state is ImagePickerSuccess ? state.pickedFile : null;

        return AppImageResolver().resolveImage(
          pickedFile: pickedFile,
          imageSource: imageSource,
          scale: scale,
          fit: fit ?? BoxFit.cover,
          width: width,
          height: height,
          placeholder: placeholder,
          errorWidget: errorWidget,
        );
      },
    );
  }
}
