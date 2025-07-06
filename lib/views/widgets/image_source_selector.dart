import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_source_item_selector.dart';

class ImageSourceSelector extends StatelessWidget {
  const ImageSourceSelector({super.key, required this.onTap});

  final Function(ImageSource) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ItemSelector(
          icon: Icons.image,
          title: 'Gallery',
          onTap: () => onTap(ImageSource.gallery),
        ),
        ItemSelector(
          icon: Icons.camera,
          title: 'Take Photo',
          onTap: () => onTap(ImageSource.camera),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
