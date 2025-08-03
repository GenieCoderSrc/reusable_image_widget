import 'package:flutter/material.dart';

/// Wraps widget in Hero if tag is provided
class HeroWrapper extends StatelessWidget {
  const HeroWrapper({super.key, required this.child, this.tag});

  final Widget child;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    if (tag == null) return child;
    return Hero(tag: tag!, child: child);
  }
}

// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:reusable_image_widget/utils/image_provider/app_image_provider.dart';
//
// import '../../constants/default_image_path.dart';
// import '../../utils/image_downloader/download_image_util.dart';
//

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
