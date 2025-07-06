# reusable_image_widget

Reusable Flutter widgets and utilities for picking, cropping, compressing, and displaying images with easy configuration
and integrated state management.

---

## Features

- Pick images from gallery or camera with a customizable picker
- Crop images with custom aspect ratio presets
- Compress images to reduce file size with quality control
- Display images from assets, local files, network URLs, or raw bytes
- Fullscreen image viewer with zoom, pan, double-tap zoom, swipe-to-dismiss, and download support
- Circular and rectangular avatar widgets with editable overlay icons
- Image placeholders and error handling with fallback support
- State management with `ImagePickerCubit` using `flutter_bloc`
- Integration-ready for dependency injection (GetIt)

---

## Installation

Add this to your `pubspec.yaml`:

```yaml
reusable_image_widget: <latest_version>
```

Then run:

```bash
flutter pub get
```

---

## Usage

### Pick and Crop Image

```dart

final XFile? pickedImage = await
pickerService.pickImage
(
source: ImageSource.gallery,
maxHeight: 500,
maxWidth: 500,
imageQuality: 85,
);

final XFile croppedImage = await cropperService.cropImage(
pickedFile: pickedImage
!
,
context
:
context
,
);

```

### Compress Image

```dart

final XFile compressedImage = await
compressorService.compressImage
(
pickedImage
,
quality
:
85
,
);

```

### Use AvatarImagePicker (Recommended)

```dart
AvatarImagePicker
(
imageSource: 'assets/images/default_avatar.png',
imageQuality: 85,
maxHeight: 500,
maxWidth: 500,
crop: true,
compress: true,
onChanged: (File? file, Uint8List? bytes) {
// Handle updated image file or bytes
},
)

```

### Display Avatar Image

```dart
AvatarImageViewer
(
imageFile: pickedFile,
imageSource: 'https://example.com/profile.jpg',
radius: 40,
showEditIcon: true,
onTapEdit: () {
// Open picker or handle edit action
},
)

```

### Use AppCircleAvatar

```dart
AppCircleAvatar
(
imageSource: 'https://example.com/profile.jpg',
radius: 40,
)
```

### Fullscreen Image Viewer

```dart
Navigator.of
(
context).push(
MaterialPageRoute(
builder: (_) => FullScreenImageViewer(
imageFile: file,
imageBytes: bytes,
imageSource: imageUrl,
heroTag: 'profile-avatar'
,
)
,
)
,
);

```

### Using AppImagePicker with Bloc

Make sure to provide `ImagePickerCubit` via `BlocProvider` and register dependencies with GetIt:

```dart
AppImagePicker
(
crop: true,
compress: true,
onChanged: (file, bytes) {
// Handle image selection
},
)

```

---

## Dependency Injection and Bloc Setup

Register services and cubit with GetIt:

```dart
void registerReusableImageWidgetDependencies() {
  sl.registerLazySingleton<AppImagePickerService>(() => AppImagePickerService());
  sl.registerLazySingleton<IImageCropperService>(() => AppImageCropperService());
  sl.registerLazySingleton<IImageCompressorService>(() => AppImageCompressorService());
  sl.registerFactory(() =>
      ImagePickerCubit(
        pickerService: sl<AppImagePickerService>(),
        cropperService: sl<IImageCropperService>(),
        compressorService: sl<IImageCompressorService>(),
      ));
}
```

Add the cubit provider in your widget tree:

```dart
MultiBlocProvider
(
providers: [
BlocProvider<ImagePickerCubit>(create: (_) => sl<ImagePickerCubit>()),
// other providers...
],
child: MyApp(),
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
- `get_it`

---

## Example

See the `example/` directory for a full example implementation demonstrating the usage of the widgets and cubit.

---

## License

© MIT License.

---

## Author

**reusable_image_widget** Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)

Contributions, issues, and pull requests are welcome!



---
