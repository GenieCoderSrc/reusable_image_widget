# reusable\_image\_widget

Reusable Flutter widgets and utilities for picking, cropping, compressing, and displaying images with easy configuration
and integrated state management.

---

## ✅ Features

* Pick images from gallery or camera with a customizable picker
* Crop images with custom aspect ratio presets
* Compress images to reduce file size with quality control
* Display images from:

    * Network URL
    * Assets
    * Local files via `XFile`
* Fullscreen image viewer with:

    * Zoom, pan, double-tap zoom, swipe-to-dismiss
    * Download image feature
* Avatar widgets (circular/rectangular) with editable overlay icons
* Custom placeholders and error handling
* Built-in state management using `ImagePickerCubit`
* Integration-ready for dependency injection (GetIt)

---

## 🚀 Installation

Add to your `pubspec.yaml`:

```yaml
reusable_image_widget: <latest_version>
```

Then run:

```bash
flutter pub get
```

---

## 📦 Usage

### ✨ Pick and Crop Image

```dart
final XFile? pickedImage = await pickerService.pickImage(
  source: ImageSource.gallery,
  maxHeight: 500,
  maxWidth: 500,
  imageQuality: 85,
);

final XFile? croppedImage = await cropperService.cropImage(
  pickedFile: pickedImage!,
  context: context,
);
```

---

### ✨ Compress Image

```dart
final XFile compressedImage = await compressorService.compressImage(
  pickedImage,
  quality: 85,
);
```

---

### 🎯 Use AvatarImagePicker (Recommended)

```dart
AvatarImagePicker(
  imageSource: 'assets/images/default_avatar.png',
  imageQuality: 85,
  maxHeight: 500,
  maxWidth: 500,
  crop: true,
  compress: true,
  onChanged: (file) {
    // Handle updated image file
  },
);
```

---

### 🖼️ Display Avatar Image

```dart
AvatarImageViewer(
  xFile: pickedFile,
  imageSource: 'https://example.com/profile.jpg',
  radius: 40,
  showEditIcon: true,
  onTapEdit: () {
    // Open picker or handle edit action
  },
);
```

---

### 👤 Use AppCircleAvatar

```dart
AppCircleAvatar(
  imageSource: 'https://example.com/profile.jpg',
  radius: 40,
);
```

---

### 🔍 Fullscreen Image Viewer

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (_) => FullScreenImageViewer(
      pickedFile: pickedFile,
      imageSource: imageUrl,
      heroTag: 'profile-avatar',
    ),
  ),
);
```

---

### 🧠 Using AppImagePicker with Bloc

Ensure `ImagePickerCubit` is provided via `BlocProvider` and dependencies are registered via `GetIt`.

```dart
AppImagePicker(
  crop: true,
  compress: true,
  onChanged: (file) {
    // Handle selected image
  },
);
```

---

## 🛠️ Dependency Injection & Bloc Setup

Register services and cubit using `GetIt`:

```dart
void registerReusableImageWidgetDependencies() {
  sl.registerLazySingleton<AppImagePickerService>(() => AppImagePickerService());
  sl.registerLazySingleton<IImageCropperService>(() => AppImageCropperService());
  sl.registerLazySingleton<IImageCompressorService>(() => AppImageCompressorService());
  sl.registerFactory(() => ImagePickerCubit(
        pickerService: sl<AppImagePickerService>(),
        cropperService: sl<IImageCropperService>(),
        compressorService: sl<IImageCompressorService>(),
      ));
}
```

Wrap your app with the cubit provider:

```dart
MultiBlocProvider(
  providers: [
    BlocProvider<ImagePickerCubit>(create: (_) => sl<ImagePickerCubit>()),
    // other providers...
  ],
  child: MyApp(),
);
```

---

## 📦 Dependencies

* `flutter`
* `image_picker`
* `image_cropper`
* `flutter_image_compress`
* `cached_network_image`
* `photo_view`
* `flutter_bloc`
* `get_it`

---

## 📁 Example

See the [`example/`](example/) directory for a full implementation.

---

## 📄 License

Licensed under the MIT License.

---

## 👨‍💼 Author

**reusable\_image\_widget**
Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)
Contributions, issues, and pull requests are welcome!

---
