import 'package:image_picker/image_picker.dart';

abstract class IImageCompressorService {
  Future<XFile> compressImage(XFile file, {int quality});
}
