import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:reusable_image_widget/constants/default_image_path.dart';
import 'package:reusable_image_widget/utils/image_provider/app_image_provider.dart';

class PhotoViewImage extends StatelessWidget {
  const PhotoViewImage({
    super.key,
    this.imageSource,
    this.pickedFile,
    this.scale,
    this.fit = BoxFit.contain,
  });

  final String? imageSource;
  final XFile? pickedFile;
  final double? scale;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final imageProvider = appImageProvider(
      imageSource: imageSource,
      pickedFile: pickedFile,
      scale: scale,
    );

    return PhotoView(
      imageProvider: imageProvider ?? const AssetImage(noImageAvailable),
      backgroundDecoration: const BoxDecoration(color: Colors.black),
      errorBuilder:
          (_, _, _) => const Center(
            child: Icon(Icons.broken_image, color: Colors.white),
          ),
      enableRotation: true,
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 3,
    );
  }
}
