import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:reusable_image_widget/app_image_provider.dart';

import 'constants/default_image_path.dart';

class FullScreenImageViewer extends StatefulWidget {
  final String? imageSource;
  final File? image;
  final String? title;
  final String? heroTag;

  const FullScreenImageViewer(
      {super.key, this.imageSource, this.image, this.title, this.heroTag});

  @override
  FullScreenImageViewerState createState() => FullScreenImageViewerState();
}

class FullScreenImageViewerState extends State<FullScreenImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: PhotoView(
          imageProvider: appImageProvider(
              imageSource: widget.imageSource ?? noImageAvailable,
              imageFile: widget.image),
        ),
      ),
    );
  }
}
