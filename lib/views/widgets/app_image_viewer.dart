import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/utils/image_provider/app_image_resolver.dart';

class AppImageViewer extends StatelessWidget {
  const AppImageViewer({
    super.key,
    this.imageSource,
    this.pickedFile,
    this.scale,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.width,
    this.height,
    this.borderRadius,
    this.clipBehavior = Clip.antiAlias,
    this.isCircular = false,
    this.backgroundColor,
  });

  final String? imageSource;
  final XFile? pickedFile;
  final double? scale;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool isCircular;
  final Color? backgroundColor;
  final Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    final image = _buildImage();

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade300,
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
            isCircular
                ? null
                : (borderRadius != null
                    ? BorderRadius.circular(borderRadius!)
                    : null),
      ),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: image,
    );
  }

  /// Builds image widget from either picked file or image source
  Widget _buildImage() {
    return AppImageResolver().resolveImage(
      imageSource: imageSource,
      pickedFile: pickedFile,
      scale: scale,
      fit: fit,
      width: width,
      height: height,
      placeholder: placeholder,
      errorWidget: errorWidget,
    );
  }
}
