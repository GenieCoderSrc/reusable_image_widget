import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:reusable_image_widget/utils/image_provider/app_image_provider.dart';

import '../../constants/default_image_path.dart';
import '../../utils/image_downloader.dart';

class FullScreenImageViewer extends StatelessWidget {
  final String? imageSource;
  final File? image;
  final Uint8List? imageBytes;
  final String? title;
  final String? heroTag;
  final double? scale;
  final BoxFit fit;

  const FullScreenImageViewer({
    super.key,
    this.imageSource,
    this.image,
    this.imageBytes,
    this.title,
    this.heroTag,
    this.scale,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    final viewer = _buildPhotoView();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: GestureDetector(
        onVerticalDragEnd: (_) => Navigator.pop(context),
        child: Center(
          child: heroTag != null ? Hero(tag: heroTag!, child: viewer) : viewer,
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title:
          title != null
              ? Text(title!, style: const TextStyle(color: Colors.white))
              : null,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [_buildImageDownloaderAction(context)],
    );
  }

  IconButton _buildImageDownloaderAction(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final result = await downloadImage(
          file: image,
          imageSource: imageSource,
          imageBytes: imageBytes,
        );
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(result)));
      },
      icon: const Icon(Icons.download_rounded),
      tooltip: 'Download Image',
    );
  }

  PhotoView _buildPhotoView() {
    final imageProvider = appImageProvider(
      imageSource: imageSource,
      imageFile: image,
      imageBytes: imageBytes,
      scale: scale,
    );
    return PhotoView(
      imageProvider: imageProvider ?? const AssetImage(noImageAvailable),
      backgroundDecoration: const BoxDecoration(color: Colors.black),
      errorBuilder:
          (_, __, ___) => const Center(
            child: Icon(Icons.broken_image, color: Colors.white),
          ),
      enableRotation: true,
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 3,
    );
  }
}

// class FullScreenImageViewer extends StatefulWidget {
//   final String? imageSource;
//   final File? image;
//   final String? title;
//   final String? heroTag;
//
//   const FullScreenImageViewer({
//     super.key,
//     this.imageSource,
//     this.image,
//     this.title,
//     this.heroTag,
//   });
//
//   @override
//   FullScreenImageViewerState createState() => FullScreenImageViewerState();
// }
//
// class FullScreenImageViewerState extends State<FullScreenImageViewer> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.black),
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: PhotoView(
//           imageProvider: appImageProvider(
//             imageSource: widget.imageSource ?? noImageAvailable,
//             imageFile: widget.image,
//           ),
//         ),
//       ),
//     );
//   }
// }
