# 📄 CHANGELOG

All notable changes to this project will be documented here.

### 🕘 Versions

 - [0.1.1](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.1.1.md)
 - [0.1.0](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.1.0.md)
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

### 0.1.1 - Jul 13, 2025

### Changed 
- ♻️ Refactored

* **Renamed**: `ImageBuilder` → `AppImageLoader`

    * Improves clarity by clearly communicating the purpose of the widget as a loader rather than a generic builder.
    * Usage updated across the library to reflect this new name:

      ```dart
      const AppImageLoader(...)
      ```

* **Optimized Conditional Logic** in `AppImageResolver.resolveImage(...)`

    * Replaced sequential `if` conditions with `else if` blocks to enforce mutually exclusive execution:

      ```dart
      if (pickedFileValid) {
        ...
      } else if (isNetworkUrl) {
        ...
      } else if (isAssetPath) {
        ...
      } else {
        return errorWidget ?? _defaultError();
      }
      ```
    * This ensures only the first valid image source path is used, improving performance and reducing unnecessary checks.

### 📄 Updated

* **appImageProvider(...)** function now follows the same `else if` conditional structure as the widget resolver:

  ```dart
  if (kIsWeb && pickedFile != null) {
    return NetworkImage(pickedFile.path);
  } else if (!kIsWeb && pickedFile != null) {
    return FileImage(File(pickedFile.path));
  } else if (imageSource?.isNetworkUrl == true) {
    return CachedNetworkImageProvider(imageSource!);
  } else if (imageSource?.isAssetPath == true) {
    return AssetImage(imageSource!);
  } else {
    return null;
  }
  ```

### 🔧 Developer Notes

* This version prepares the ground for upcoming enhancements in error handling and placeholder customization.
* The change to `AppImageLoader` improves semantic alignment with `AppImageViewer` and `AppImageResolver`.

---

*Make sure to update all instances of `ImageBuilder` to `AppImageLoader` to avoid breaking changes.*

