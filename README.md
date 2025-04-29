# reusable_image_widget

Reusable Flutter widgets and utilities for picking, cropping, compressing, and displaying images with easy configuration.

---

## Features

- Pick images from the gallery or camera
- Crop images with custom aspect ratio presets
- Compress picked images
- Display images from assets, files, or network URLs
- Fullscreen image viewer with zooming
- Circular avatar widgets
- Image placeholders and error handling

---

## Installation

Add this to your `pubspec.yaml`:

```yaml
reusable_image_widget: ^0.0.2
```

Then run:

```bash
flutter pub get
```

---

## Usage

### Pick and Crop Image
```dart
final XFile? pickedImage = await pickImage(source: ImageSource.gallery);
if (pickedImage != null) {
  final XFile croppedImage = await cropImage(pickedFile: pickedImage, context: context);
}
```

### Compress Image
```dart
final XFile compressedImage = await compressImage(pickedImage);
```

### Display Image
```dart
BuildAvatarImage(
  imageSource: 'https://example.com/image.jpg',
)
```

or from an asset:

```dart
BuildAvatarImage(
  imageSource: 'assets/images/profile_pic.jpeg',
)
```

### Use AppCircleAvatar
```dart
AppCircleAvatar(
  imageSource: 'https://example.com/profile.jpg',
  radius: 40,
)
```

### Full Screen Viewer
```dart
AvatarImageViewer(
  image: pickedFile,
  imageSource: 'https://example.com/image.jpg',
)
```

### Pick Image with Cubit
```dart
AppImagePicker(
  onChanged: (file) {
    // Do something with the picked image
  },
)
```

### Show Network Image with Fallback
```dart
CachedImage(
  'https://example.com/image.jpg',
  radius: 50,
  isRound: true,
)
```

---

## Dependencies

- `flutter`
- `image_picker`
- `image_cropper`
- `flutter_image_compress`
- `cached_network_image`
- `photo_view`
- `flutter_bloc`

---

## Example

A complete usage example can be found in the `example/` directory.

---

## License

MIT License

---

## Author

**reusable_image_widget** developed and maintained by Shohidul Islam

Feel free to contribute, open issues, and submit pull requests!

