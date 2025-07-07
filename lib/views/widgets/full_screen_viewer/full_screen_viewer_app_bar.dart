import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/utils/image_downloader/download_image_util.dart';

class FullScreenViewerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const FullScreenViewerAppBar({
    super.key,
    required this.pickedFile,
    required this.imageSource,
    this.title,
  });

  final XFile? pickedFile;
  final String? imageSource;
  final String? title;

  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  IconButton _buildImageDownloaderAction(BuildContext context) {
    return IconButton(
      tooltip: 'Download Image',
      icon: const Icon(Icons.download_rounded),
      onPressed: () async {
        final result = await downloadImage(
          pickedFile: pickedFile,
          imageSource: imageSource,
        );
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(result)));
      },
    );
  }
}
