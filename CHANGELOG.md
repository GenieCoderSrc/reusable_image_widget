# Changelog

All notable changes to this project will be documented in this file.

## 0.0.6 – Jul 7, 2025

### ✨ Added

- `ImagePickerManager` class:
- `MountedCheck` typedef for safe context handling across async gaps.

### ✅ Updated

- `ImagePickerCubit` now offloads side-effect operations to the manager layer.

### 🛠️ Refactored

- Restructured cropper service:
- Improved separation of concerns across service, manager, and UI layers.

---


## 0.0.5 – Jul 7, 2025

### ✅ Updated

- **Unified image handling with `XFile`**:
  - Removed usage of `Uint8List` for `ImagePicker` output.
  - `AppImagePicker`, `FullScreenImageViewer`, and related utilities now use `XFile` exclusively.
- Refactored `AppImageResolver` and `appImageProvider()` to support all platforms via `XFile`.
- Optimized widget structure to avoid duplicate storage of file and byte state.

### 🛠️ Refactored

- Removed legacy memory-based `Uint8List` image handling in favor of cleaner, async-free `XFile`-based rendering.
- Ensured full support for web and native platforms using `Image.network()` and `FileImage()` as needed.

---

## 0.0.4 – Jul 6, 2025

### ✨ Added

- `typedef`s for typed callbacks:
  - `ImageDataCallback`
  - `VoidImageDataCallback`
  - `WidgetImageDataCallback`

---

## 0.0.3 – Jul 6, 2025

### ✨ Added

- `AppImagePicker` widget with `ImagePickerCubit` state management.
- `AvatarImageViewer` with:
  - Circular or rectangular image display.
  - Editable icon overlay with customizable position.
  - Double-tap to open `FullScreenImageViewer`.
- `FullScreenImageViewer`:
  - Supports zoom, pan, double-tap zoom, swipe-to-dismiss.
  - Supports image from `File`, `Uint8List`, or network/asset source.
  - Download support for viewing images.
- `AvatarImagePicker` enhancements:
  - Accepts `radius`, `heroTag`, `isCircleAvatar`, `onTapEdit`, `editIcon`, etc.
  - Fully integrated with `AppImagePicker` for image state propagation.
- `AvatarStyleConstants` for centralized avatar size and layout presets.

### ✅ Updated

- Refactored `AppImagePicker` for flexibility and better builder usage.
- Integrated `AppImagePicker` with image cropping and compression via cubit.
- Improved error handling, null safety, and loading state visuals.
- Fully integrated `ImagePickerCubit` with `flutter_bloc` and `get_it`.

### 🛠️ Refactored

- Modularized avatar viewer structure.
- Separated image preview logic into reusable components.
- Clarified naming and responsibilities across image components.

---

## 0.0.2+1 – Jun 30, 2025

- Replaced `ImagePickerCubit` in view model.

---

## 0.0.2 – Jun 24, 2025

- Fixed error in `compress_image.dart` file.

---

## 0.0.1 – Apr 29, 2025

- Added `AvatarImagePicker` widget for selecting and cropping images.
- Added `FullScreenImageViewer` widget for displaying images in full screen.
- Supports picking images from device gallery or camera.
- Supports cropping images before selecting.
- Provides callbacks to access selected images.
