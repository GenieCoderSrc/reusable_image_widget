// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
//
// Future<XFile> cropImage(
//     {required XFile pickedFile, required BuildContext context}) async {
//   try {
//     CroppedFile? croppedFile = await ImageCropper().cropImage(
//     sourcePath: pickedFile.path,
//     uiSettings: [
//       AndroidUiSettings(
//         toolbarTitle: 'Cropper',
//         toolbarColor: Colors.deepOrange,
//         toolbarWidgetColor: Colors.white,
//         aspectRatioPresets: [
//           CropAspectRatioPreset.original,
//           CropAspectRatioPreset.square,
//           CropAspectRatioPresetCustom(),
//         ],
//       ),
//       IOSUiSettings(
//         title: 'Cropper',
//         aspectRatioPresets: [
//           CropAspectRatioPreset.original,
//           CropAspectRatioPreset.square,
//           CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
//         ],
//       ),
//       WebUiSettings(
//         context: context,
//       ),
//     ],
//   );
//
//   String? croppedFilePath = croppedFile?.path;
//
//     if (croppedFilePath != null) {
//       return XFile(croppedFilePath);
//     }
//     return pickedFile;
//   } catch (e) {
//     return pickedFile;
//   }
// }
//
//
//
// class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
//   @override
//   (int, int)? get data => (2, 3);
//
//   @override
//   String get name => '2x3 (customized)';
// }
