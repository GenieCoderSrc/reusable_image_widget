import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_builder/shimmer.dart';

import 'constants/default_image_path.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final bool isRound;
  final double radius;
  final double? height;
  final double? width;

  final BoxFit fit;

  final String onErrorImage;

  const CachedImage(
    this.imageUrl, {
    this.isRound = false,
    this.radius = 0,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.onErrorImage = noImageAvailable,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    try {
      return imageUrl != null
          ? CachedNetworkImage(
              imageUrl: imageUrl ?? kProfileIconUrl,
              imageBuilder:
                  (BuildContext context, ImageProvider<Object> imageProvider) =>
                      Container(
                height: isRound ? radius : height,
                width: isRound ? radius : width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  image: DecorationImage(image: imageProvider, fit: fit),
                ),
              ),
              placeholder: (BuildContext context, String url) =>
                  ShimmerLoading(height: height, width: width),
              errorWidget: (BuildContext context, String url, Object? error) =>
                  Container(
                height: isRound ? radius : height,
                width: isRound ? radius : width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(onErrorImage)),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            )
          : Container();
    } catch (e) {
      debugPrint(e.toString());
      return Image.network(
        noImageAvailable,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const Icon(Icons.do_not_disturb);
        },
      );
    }
  }
}
