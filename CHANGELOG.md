# 📄 CHANGELOG

All notable changes to this project will be documented here.

## 🕘 Versions

 * Version: - [0.0.7](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.7.md)
 * Version: - [0.0.6](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.6.md)
 * Version: - [0.0.5](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.5.md)
 * Version: - [0.0.4](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.4.md)
 * Version: - [0.0.3](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.3.md)
 * Version: - [0.0.2](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.2.md)
 * Version: - [0.0.1](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.0.1.md)

## 🔥 Latest Summary


## 0.0.7 – Jul 9, 2025

### ✨ Added

* `PhotoViewImageBuilder` widget:

    * Provides dynamic rendering of image previews using `ImagePickerCubit` state.
    * Supports network, asset, or picked image fallback.
* `ImageBuilder` widget:

    * Rebuilds automatically based on `ImagePickerCubit` state.
    * Replaces the need to manually pass `pickedFile` to image widgets.
* `FullScreenImageViewer` and `AvatarImageViewer` now resolve image from `ImagePickerCubit` automatically if not passed directly.

### ✅ Updated

* `AppImageViewer` now uses `ImageBuilder` to auto-resolve picked image via cubit.
* `AppImagePicker` supports generic `<T>` with `onChanged(T? file)` callback:

    * Now supports flexible types like `Uint8List`, `File`, `XFile`.
* Refactored `PhotoViewImage` to support `appImageProvider()` fallback behavior.
* Updated `_openFullScreenViewer()` in `AvatarImageViewer` to auto-fetch cubit image.
* `ImagePickerCubit` image reset on pop (auto-dispose behavior).

### 🛠️ Refactored

* Removed need to pass `pickedFile` across multiple widgets by resolving directly from cubit.
* Unified `FullScreenImageViewer`, `AppImageViewer`, and avatar components under a cleaner cubit-based image pipeline.
* Improved SOLID compliance and minimized props by relying on `ImagePickerCubit`.
* Consolidated avatar + full screen photo viewing behavior under consistent logic using `PhotoViewImageBuilder`.

---


