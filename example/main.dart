import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

// main.dart snippet

void main() {
  registerReusableImageWidgetDependencies();
  initReusableImageWidgetBlocProvider();

  runApp(
    MultiBlocProvider(
      providers: reusableImageWidgetBlocProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const AvatarImagePickerExample());
  }
}

// example/avatar_image_picker_example.dart

class AvatarImagePickerExample extends StatefulWidget {
  const AvatarImagePickerExample({super.key});

  @override
  State<AvatarImagePickerExample> createState() =>
      _AvatarImagePickerExampleState();
}

class _AvatarImagePickerExampleState extends State<AvatarImagePickerExample> {
  File? _pickedFile;
  Uint8List? _pickedBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar Image Picker Example')),
      body: Center(
        child: AvatarImagePicker(
          imageSource: 'assets/images/default_avatar.png',
          imageQuality: 85,
          maxHeight: 500,
          maxWidth: 500,
          crop: true,
          compress: true,
          cameraEnabled: true,
          galleryEnabled: true,
          onChanged: (File? file, Uint8List? bytes) {
            setState(() {
              _pickedFile = file;
              _pickedBytes = bytes;
            });
          },
        ),
      ),
    );
  }


}


