# 📄 CHANGELOG

All notable changes to this project will be documented here.

### 🕘 Versions

 - [0.0.9](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.9.md)
 - [0.0.8](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.8.md)
 - [0.0.7](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.7.md)
 - [0.0.6](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.6.md)
 - [0.0.5](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.5.md)
 - [0.0.4](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.4.md)
 - [0.0.3](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.3.md)
 - [0.0.2](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.2.md)
 - [0.0.1](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.1.md)

### 🔥 Latest Summary

### 0.0.9 – 2025-07-12

### ♻️ Refactored

- **Removed** all image_picker-related logic from the package.
- **Replaced** any direct dependency on `image_picker` with `XFile? pickedFile` from `cross_file`, ensuring full cross-platform compatibility.

### ✨ Added

- `pickedFile` property to `AppImageViewer` and `ImageBuilder` to support dynamic rendering of images picked outside this package.
- Updated `AppImageResolver` to cleanly support rendering images from:
  - `XFile` on Web and Mobile
  - Network (via `CachedNetworkImage`)
  - Asset images
- More flexible handling of UI display scenarios.

### 📦 Dependencies

- **Added:** `cross_file` for platform-agnostic `XFile` support.
- **Retained:** `cached_network_image` for optimized network image loading.

---
