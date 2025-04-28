import 'package:flutter/material.dart';
import 'package:app_style/app_style.dart';

class ImageWithTitle extends StatelessWidget {
  final String? title;
  final String? logoPath;

  const ImageWithTitle({super.key, this.title, this.logoPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(logoPath ?? 'logo.jpg'),
          ),
        ),
        Text(
          title ?? '',
          style: AppTxtStyles.kTitle24,
        ),
      ],
    );
  }
}
