# 📷 reusable\_image\_widget

A powerful, flexible, and platform-aware Flutter image handling package that supports displaying avatars, full-screen image viewing, file/network/asset loading, and gallery saving with minimal setup.

---

## ✨ Features

* ✔ Load images from `XFile`, network URLs, or asset paths
* ✔ Auto-detect platform and image source
* ✔ Full-screen image viewer with zoom, rotation, and hero animation
* ✔ Circular or rectangular avatar widgets
* ✔ Avatar with online indicator and edit support
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

### 1. Basic Viewer

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

### 3. Edit Profile Image Viewer

```dart
EditProfileImageViewer(
  pickedFile: pickedFile,
  imageSource: pickedFile?.path,
  radius: 60,
  showEditIcon: true,
  onTapEdit: () => pickImage(),
)
```

### 4. Avatar With Online Indicator

```dart
AvatarWithOnlineIndicator(
  imageSource: 'https://example.com/image.jpg',
  isOnline: true,
  border: true,
  shadow: true,
  imgRadius: 50,
)
```

### 5. AppAvatar (Circle or Rectangle)

```dart
AppAvatar(
  isCircle: true,
  imageSource: 'https://example.com/image.jpg',
  radius: 48,
)
```

---

## 🎨 Avatar Widgets

* `AppAvatar` — root avatar builder (circle or rectangle)
* `AppCircleAvatar`
* `AppRectangleAvatar`
* `EditProfileImageViewer` — avatar with edit icon & full-screen support
* `AvatarWithOnlineIndicator` — avatar with status badge

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

## ⚧ Dependencies

```yaml
dependency_overrides:
  cached_network_image: <latest_version>
  photo_view: <latest_version>
  image_gallery_saver_plus: <latest_version>
  permission_handler: <latest_version>
```

---

## 📖 Example

```dart
AvatarTitleGridCard(
  title: 'Your Logo',
  imageSource: 'assets/icons/logo.jpg',
  isCircleAvatar: true,
)
```

> 🔊 Note: Previously named `ImageWithTitle`, now moved to `reusable_list_item` package.

---

## 📄 License

MIT © 2025 reusable\_image\_widget authors

---

## 🚀 Contributing

Pull requests and issues are welcome!

---

## 🔗 Links

* [PhotoView](https://pub.dev/packages/photo_view)
* [CachedNetworkImage](https://pub.dev/packages/cached_network_image)
* [image_gallery_saver_plus](https://pub.dev/packages/image_gallery_saver_plus)
* [permission\_handler](https://pub.dev/packages/permission_handler)

## 👨‍💼 Author

**reusable\_image\_widget**
Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)
Contributions, issues, and pull requests are welcome!

---
