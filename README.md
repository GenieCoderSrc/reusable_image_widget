# reusable\_image\_widget

A modular and flexible Flutter image/avatar viewing utility with support for:

* Circular and rectangular avatars
* Asset, network, and file-based image resolution
* Full-screen image viewing with pinch-to-zoom (PhotoView)
* Image downloading
* Placeholder/error fallback widgets
* Web/mobile/desktop support

---

## 📦 Features

* Unified API for displaying images from `XFile`, assets, or URLs
* Circular, rectangular, or custom avatar support
* Hero animation for full-screen preview
* Image saving functionality (non-Web platforms)
* Highly customizable: radius, border, fit, fallback, colors

---

## 🧱 Core Components

### `AvatarStyleConstants`

Defines common spacing, padding, and radius used throughout avatar components.

```dart
class AvatarStyleConstants {
  static const double defaultRadius = 40;
  static const double editIconOffset = -6.0;
  static const EdgeInsets avatarPadding = EdgeInsets.all(8.0);
  static const EdgeInsets editIconCardMargin = EdgeInsets.all(8.0);
  static const EdgeInsets editIconPadding = EdgeInsets.all(4.0);
}
```

### `ImageSourceExtension`

Adds helper to check whether a string represents an asset path.

```dart
extension ImageSourceExtension on String {
  bool get isAssetPath => startsWith('assets/');
}
```

### `appImageProvider()`

Returns an appropriate `ImageProvider` based on asset, file, or network.

### `AppImageViewer`

Base widget that renders an image inside a decorated container. Supports:

* `XFile`
* `imageSource` (String path or URL)
* `isCircular`, `borderRadius`, `placeholder`, `errorWidget`

### `ImageBuilder`

Internal utility widget that resolves image via `AppImageResolver`.

### `AppCircleAvatar` / `AppRectangleAvatar`

Pre-configured image viewer for circular or rounded rectangle style.

### `AvatarImageViewer`

Composite widget for user avatars with optional edit icon and full-screen view on double tap.

### `FullScreenImageViewer`

Displays image in full-screen mode using `PhotoView` and `Hero`.

---

## 📥 Downloading Images

Use `downloadImage({pickedFile, imageSource})` to save the image to device gallery (Android/iOS only).

```dart
final result = await downloadImage(
  pickedFile: file,
  imageSource: url,
);
```

---

## 🖼 Usage Examples

### Avatar Image with Edit Icon

```dart
AvatarImageViewer(
  imageSource: 'assets/images/profile_pic.jpeg',
  pickedFile: pickedFile,
  heroTag: 'profile-avatar',
  showEditIcon: true,
  onTapEdit: () => _pickNewImage(),
)
```

### Full-Screen Viewer

```dart
FullScreenImageViewer(
  imageSource: 'https://example.com/photo.jpg',
  heroTag: 'profile-avatar',
)
```

### Rectangle Avatar

```dart
AppRectangleAvatar(
  imageSource: kLogoIconPath,
  radius: 12,
  height: 100,
  width: 100,
)
```

---

## 📁 Constants Used

```dart
const String kProfileIconPath = 'assets/images/profile_pic.jpeg';
const String kProfileIconUrl = 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?...';
const String kLogoIconPath = 'assets/icons/logo.jpg';
const String noImageAvailable = 'https://.../no_image_available.jpeg';
```

---

## 📸 Dependencies

* `photo_view`
* `cached_network_image`
* `image_gallery_saver`
* `permission_handler`
* `http`
* `cross_file`

---

## 🧪 Platform Support

| Feature          | Web | Android | iOS | Desktop         |
| ---------------- | --- | ------- | --- | --------------- |
| Image preview    | ✅   | ✅       | ✅   | ✅               |
| Full-screen view | ✅   | ✅       | ✅   | ✅               |
| Image download   | ❌   | ✅       | ✅   | ⚠️ (Not tested) |

---

## 📄 License

Licensed under the MIT License.

---

## 👨‍💼 Author

**reusable\_image\_widget**
Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)
Contributions, issues, and pull requests are welcome!

---
