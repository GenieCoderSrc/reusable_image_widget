import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/utils/image_downloader/i_image_downloader/i_image_downloader.dart';
import 'package:reusable_image_widget/utils/image_downloader/image_downloader_impl.dart';

class FullScreenViewerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const FullScreenViewerAppBar({
    super.key,
    this.pickedFile,
    this.imageSource,
    this.title,
    this.imageDownloader = const ImageDownloaderImpl(), // 👈 default value
  });

  final XFile? pickedFile;
  final String? imageSource;
  final String? title;
  final IImageDownloader imageDownloader;

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
        final result = await imageDownloader.downloadImage(
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
