import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/views/widgets/full_screen_viewer/hero_wrapper.dart';

import 'full_screen_viewer_app_bar.dart';
import 'photo_view_image.dart';

class FullScreenImageViewer extends StatelessWidget {
  const FullScreenImageViewer({
    super.key,
    this.imageSource,
    this.pickedFile,
    this.title,
    this.heroTag,
    this.scale,
    this.fit = BoxFit.contain,
  });

  final String? imageSource;
  final XFile? pickedFile;
  final String? title;
  final String? heroTag;
  final double? scale;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: FullScreenViewerAppBar(
        imageSource: imageSource,
        pickedFile: pickedFile,
        title: title,
      ),
      body: GestureDetector(
        onVerticalDragEnd: (_) => Navigator.pop(context),
        child: Center(
          child: HeroWrapper(
            tag: heroTag,
            child: PhotoViewImage(
              imageSource: imageSource,
              pickedFile: pickedFile,
              scale: scale,
            ),
          ),
        ),
      ),
    );
  }
}
