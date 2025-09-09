import 'package:cross_file/cross_file.dart';

/// Abstraction for downloading and saving images
abstract class IImageDownloader {
  Future<String> downloadImage({XFile? pickedFile, String? imageSource});
}
