# Changelog

All notable changes to this project will be documented in this file.

## 0.0.3 – Jul 6, 2025

### ✨ Added
- `AppImagePicker` widget with `ImagePickerCubit` state management.
- `AvatarImageViewer` with:
    - Circular or rectangular display.
    - Editable icon overlay.
    - Double-tap to open fullscreen viewer.
- `FullScreenImageViewer`:
    - Zoom, pan, double-tap zoom, and swipe-to-dismiss.
    - Download support with `imageFile`, `imageBytes`, or `imageSource`.
- `AvatarImagePicker` improvements:
    - Supports radius, shape toggle, edit icon, and `heroTag`.
    - Fully integrated with `AppImagePicker` and cubit updates.
- Centralized avatar styles via `AvatarStyleConstants`.

### ✅ Updated
- Renamed and refactored `AppImagePicker` for better reusability.
- Improved error handling and loading state.
- Full integration with `flutter_bloc` and `get_it`.

### 🛠️ Refactored
- Modularized avatar display logic.
- Extracted preview logic to reusable viewer widget.

---

## 0.0.2+1 – Jun 30, 2025
- Replaced `ImagePickerCubit` in view model.

## 0.0.2 – Jun 24, 2025
- Fixed error in `compress_image.dart` file.

## 0.0.1 – Apr 29, 2025
- Added `AvatarImagePicker` widget for selecting and cropping images.
- Added `FullScreenImageViewer` widget for displaying images in full screen.
- Supports picking images from device gallery or camera.
- Supports cropping images before selecting.
- Provides callbacks to access selected images.
