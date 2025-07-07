import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/views/widgets/image_picker/image_source_item_selector.dart';

class ImageSourceSelector extends StatelessWidget {
  final void Function(ImageSource source) onTap;

  const ImageSourceSelector({
    super.key,
    required this.onTap,
    this.cameraTitle,
    this.galleryTitle,
  });

  final String? cameraTitle;
  final String? galleryTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          ItemSelector(
            icon: Icons.camera_alt,
            title: cameraTitle ?? 'Camera', // 'Take Photo'
            onTap: () => onTap(ImageSource.camera),
          ),
          ItemSelector(
            icon: Icons.photo_library,
            title: galleryTitle ?? 'Gallery',
            onTap: () => onTap(ImageSource.gallery),
          ),
        ],
      ),
    );
  }
}
