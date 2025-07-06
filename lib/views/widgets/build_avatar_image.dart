// import 'dart:io';
// import 'dart:typed_data' show Uint8List;
//
// import 'package:flutter/material.dart';
// import 'package:reusable_image_widget/constants/default_image_path.dart';
// import 'package:reusable_image_widget/services/app_image_provider.dart';
//
// class BuildAvatarImage extends StatelessWidget {
//   const BuildAvatarImage({
//     super.key,
//     this.imageSource,
//     this.imageFile,
//     this.imageBytes,
//     this.radius = 40.0,
//   });
//
//   final String? imageSource;
//   final File? imageFile;
//   final Uint8List? imageBytes;
//   final double radius;
//
//   @override
//   Widget build(BuildContext context) {
//     final ImageProvider? provider = appImageProvider(
//       imageSource: imageSource ?? kProfileIconPath,
//       imageFile: imageFile,
//       imageBytes: imageBytes,
//     );
//
//     return Container(
//       width: radius * 2,
//       height: radius * 2,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         image:
//             provider != null
//                 ? DecorationImage(image: provider, fit: BoxFit.cover)
//                 : null,
//         color: provider == null ? Colors.grey.shade300 : null,
//       ),
//       child: provider == null ? Icon(Icons.person, size: radius) : null,
//     );
//   }
// }
//
// // class BuildAvatarImage extends StatelessWidget {
// //   const BuildAvatarImage({super.key, this.imageSource, this.img});
// //
// //   final String? imageSource;
// //   final File? img;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // final Widget? imageViewer = appImageViewer(
// //     //   imageSource: imageSource ?? kProfileIconPath,
// //     //   imageFile: img,
// //     // );
// //
// //     final ImageProvider? imageProvider = appImageProvider(
// //       imageSource: imageSource ?? kProfileIconPath,
// //       imageFile: img,
// //     );
// //
// //     if (imageProvider != null) {
// //       // return Container(
// //       //   clipBehavior: Clip.antiAlias,
// //       //   decoration: BoxDecoration(
// //       //     color: Colors.deepPurpleAccent,
// //       //     shape: BoxShape.circle,
// //       //   ),
// //       //   child: imageViewer,
// //       // );
// //
// //       return Container(
// //         // height: 100.0,
// //         // width: 100.0,
// //         decoration: BoxDecoration(
// //           shape: BoxShape.circle,
// //           image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
// //           // border: Border.all(color: Colors.white, width: 0.0),
// //         ),
// //       );
// //
// //       //   return Container(
// //       //   width: radius ?? 100,
// //       //   height: radius ?? 100,
// //       //   decoration: BoxDecoration(
// //       //     shape: BoxShape.circle,
// //       //   ),
// //       //   child: BuildAvatarImage(imageSource: imageSource, img: img),
// //       // );
// //
// //       // return Image(
// //       //   image: imageProvider,
// //       //   fit: BoxFit.cover,
// //       // );
// //       // return ClipOval(
// //       //   child: Image(
// //       //     image: imageProvider,
// //       //     fit: BoxFit.fill,
// //       //   ),
// //       // );
// //     } else {
// //       return const Icon(
// //         Icons.person,
// //       ); // Placeholder icon if no image is provided
// //     }
// //   }
// // }
