# 📄 CHANGELOG

All notable changes to this project will be documented here.

### 🕘 Versions

 - [0.1.2](https://github.com/GenieCoderSrc/reusable_image_widget/blob/main/changelog/0.1.2.md)
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

## 0.1.2

### Jul 14, 2025

### ✨ Added
- Introduced `AppAvatar` widget:
    - Dynamically renders `AppCircleAvatar` or `AppRectangleAvatar` based on the `isCircle` flag.

### ♻️ Changed
- `AvatarImageViewer` ➜ `EditProfileImageViewer`.
- `EditAvatarIcon` ➜ `EditProfileIcon`.
- `CircleAvatarWithOnlineIndicator` ➜ `AvatarWithOnlineIndicator`, now uses `AppAvatar` with `AppCircleAvatar`.

### 🔥 Removed
- `ImageWithTitle` widget has been removed from this package.
    - It is now renamed to `AvatarTitleGridCard` and migrated to the `reusable_list_item` package.

