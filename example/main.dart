import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

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
    return const MaterialApp(home: AvatarImagePickerDemo());
  }
}

// example/avatar_image_picker_example.dart

// example/avatar_image_picker_demo.dart

class AvatarImagePickerDemo extends StatelessWidget {
  const AvatarImagePickerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar Image Picker Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AvatarImagePicker(
            imageSource: 'assets/images/default_avatar.png',
            imageQuality: 85,
            maxHeight: 500,
            maxWidth: 500,
            crop: true,
            compress: true,
            cameraEnabled: true,
            galleryEnabled: true,
            onChanged: (XFile? pickedFile) {
              // You can handle the file (e.g., upload, save, preview)
              debugPrint('Picked image: ${pickedFile?.path}');
            },
          ),
        ),
      ),
    );
  }
}
