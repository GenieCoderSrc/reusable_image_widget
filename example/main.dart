import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Image Widget Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ImageViewerExample(),
    );
  }
}

class ImageViewerExample extends StatefulWidget {
  const ImageViewerExample({super.key});

  @override
  State<ImageViewerExample> createState() => _ImageViewerExampleState();
}

class _ImageViewerExampleState extends State<ImageViewerExample> {
  XFile? pickedFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() => pickedFile = file);
    }
  }

  @override
  Widget build(BuildContext context) {
    const sampleNetworkImage =
        'https://i.pravatar.cc/300'; // Replace with your image URL

    return Scaffold(
      appBar: AppBar(title: const Text('Reusable Image Viewer')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("1️⃣ Asset Image Viewer"),
            const SizedBox(height: 8),
            const AppImageViewer(
              imageSource: 'assets/avatar_placeholder.png',
              width: 120,
              height: 120,
              isCircular: true,
            ),
            const Divider(height: 40),

            const Text("2️⃣ Network Image Viewer"),
            const SizedBox(height: 8),
            const AppImageViewer(
              imageSource: sampleNetworkImage,
              width: 120,
              height: 120,
              isCircular: true,
            ),
            const Divider(height: 40),

            const Text("3️⃣ Picked File Image Viewer"),
            const SizedBox(height: 8),
            AppImageViewer(
              pickedFile: pickedFile,
              imageSource: pickedFile?.path,
              width: 120,
              height: 120,
              isCircular: true,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: pickImage,
              icon: const Icon(Icons.photo),
              label: const Text("Pick Image"),
            ),
          ],
        ),
      ),
    );
  }
}
