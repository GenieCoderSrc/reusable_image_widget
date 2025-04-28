import 'dart:io';

import 'package:flutter/material.dart';

import 'app_circle_avatar.dart';
import 'constants/default_image_path.dart';
import 'full_screen_image_viewer.dart';

class AvatarImageViewer extends StatelessWidget {
  final String? imageSource;
  final File? image;

  const AvatarImageViewer(
      {super.key, this.imageSource = kProfileIconPath, this.image});

  @override
  Widget build(BuildContext context) {
    debugPrint('AvatarImageViewer | build | image: ${image?.path}');
    return GestureDetector(
      onDoubleTap: () => image != null || imageSource != null
          ? Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (BuildContext context) => FullScreenImageViewer(
                    image: image, imageSource: imageSource),
              ),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            AppCircleAvatar(img: image, imageSource: imageSource),
            Positioned(
                bottom: -6.0,
                right: -6.0,
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.add_a_photo,
                        color: Colors.blueGrey.shade200),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
