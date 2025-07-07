import 'package:app_style/app_style.dart';
import 'package:flutter/material.dart';

import 'avatar_image_viewer.dart';

class ImageWithTitle extends StatelessWidget {
  final String? title;
  final String? logoPath;
  final bool? isCircleAvatar;

  const ImageWithTitle({
    super.key,
    this.title,
    this.logoPath,
    this.isCircleAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AvatarImageViewer(
            imageSource: logoPath ?? 'logo.jpg',
            radius: 50,
            isCircleAvatar: isCircleAvatar,
          ),
          // child: CircleAvatar(
          //   radius: 50,
          //   backgroundImage: AssetImage(logoPath ?? 'logo.jpg'),
          // ),
        ),
        Text(title ?? '', style: AppTxtStyles.kTitle24),
      ],
    );
  }
}
