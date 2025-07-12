# 📷 reusable_image_widget

A powerful, flexible, and platform-aware Flutter image handling package that supports displaying avatars, full-screen image viewing, file/network/asset loading, and gallery saving with minimal setup.

---

## ✨ Features

* ✔ Load images from `XFile`, network URLs, or asset paths
* ✔ Auto-detect platform and image source
* ✔ Full-screen image viewer with zoom, rotation, and hero animation
* ✔ Circular or rectangular avatar widgets
* ✔ Customizable placeholder and error widgets
* ✔ Platform-aware image downloading (web, mobile, desktop)
* ✔ Lightweight and easily composable

---

## 📂 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  reusable_image_widget: ^latest_version
```

---

## 🌍 Cross-Platform Image Support

Internally detects platform and source:

* `XFile` (picked files)
* Network URL
* Asset path (starts with `assets/`)

Uses:

* `FileImage` / `Image.file`
* `NetworkImage` / `CachedNetworkImage`
* `AssetImage`
* `MemoryImage` (for web)

---

## 🚀 Usage

### 1. Basic Usage

```dart
AppImageViewer(
  imageSource: 'assets/images/profile_pic.jpeg',
)
```

### 2. From Picked File

```dart
AppImageViewer(
  pickedFile: pickedFile, // XFile
)
```

### 3. Avatar Image

```dart
AppAvatarImage(
  imageSource: 'https://example.com/image.jpg',
  radius: 48,
)
```

### 4. Full Screen Viewer

```dart
FullScreenImageViewer(
  imageSource: 'https://example.com/image.jpg',
  heroTag: 'profile_pic',
)
```

---

## 🎨 Avatar Widgets

* `AppAvatarImage` — circular or rectangle with fallback
* `AppCircleAvatar`
* `AppRectangleAvatar`
* `AvatarImageViewer` — avatar with edit icon & full-screen support

---

## 🔄 Image Download (All Platforms)

```dart
final result = await downloadImage(
  pickedFile: pickedFile,
  imageSource: 'https://example.com/image.jpg',
);
```

### Web Support

Web download is handled using `AnchorElement` and `Uint8List blob` download.

---

## 🎨 Customization

Each widget accepts:

* `placeholder`
* `errorWidget`
* `scale`, `fit`, `backgroundColor`, etc.

---

## 🍂 Constants & Styling

```dart
AvatarStyleConstants.defaultRadius
AvatarStyleConstants.avatarPadding
```

---

## 🎓 Extensions

```dart
'image.jpg'.isAssetPath // true if starts with 'assets/'
```

---

## 👁 Hero Support

```dart
HeroWrapper(
  tag: 'profile_pic',
  child: AppImageViewer(...),
)
```

---

## 🚧 Dependencies

```yaml
dependency_overrides:
  cached_network_image: ^3.3.1
  photo_view: ^0.14.0
  image_gallery_saver: ^2.0.3
  permission_handler: ^11.3.0
```

---

## 📖 Example

```dart
ImageWithTitle(
  title: 'Your Logo',
  logoPath: 'assets/icons/logo.jpg',
  isCircleAvatar: true,
)
```

---

## 📄 License

MIT © 2025 reusable_image_widget authors

---

## 🚀 Contributing

Pull requests and issues are welcome!

---

## 🔗 Links

* [PhotoView](https://pub.dev/packages/photo_view)
* [CachedNetworkImage](https://pub.dev/packages/cached_network_image)
* [ImageGallerySaver](https://pub.dev/packages/image_gallery_saver)
* [permission\_handler](https://pub.dev/packages/permission_handler)

## 👨‍💼 Author

**reusable_image_widget**
Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)
Contributions, issues, and pull requests are welcome!

---
