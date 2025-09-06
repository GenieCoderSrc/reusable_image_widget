import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/constants/avatar_style_constants.dart';
import 'package:reusable_image_widget/views/widgets/full_screen_viewer/full_screen_image_viewer.dart';
import 'package:reusable_image_widget/views/widgets/full_screen_viewer/hero_wrapper.dart';
import 'package:reusable_image_widget/views/widgets/image_viewer/app_rectangle_avatar.dart';

import '../../../constants/default_image_path.dart';
import '../image_viewer/app_circle_avatar.dart';
import 'edit_profile_icon.dart';

class EditProfileImageViewer extends StatelessWidget {
  const EditProfileImageViewer({
    super.key,
    this.pickedFile,
    this.imageSource = kProfileIconPath,
    this.radius = AvatarStyleConstants.defaultRadius,
    this.heroTag,
    this.showEditIcon = true,
    this.openFullScreenViewer = false,
    this.isCircleAvatar,
    this.onTapEdit,
    this.editIcon,
  });

  final XFile? pickedFile;
  final String? imageSource;
  final double radius;
  final String? heroTag;
  final bool showEditIcon;
  final bool openFullScreenViewer;
  final bool? isCircleAvatar;
  final VoidCallback? onTapEdit;
  final Widget? editIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap:
          openFullScreenViewer ? () => _openFullScreenViewer(context) : null,
      child: Padding(
        padding: AvatarStyleConstants.avatarPadding,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            HeroWrapper(tag: heroTag, child: _buildAvatar()),
            if (showEditIcon)
              Positioned(
                bottom: AvatarStyleConstants.editIconOffset,
                right: AvatarStyleConstants.editIconOffset,
                child: GestureDetector(
                  onTap: onTapEdit,
                  child: editIcon ?? const EditProfileIcon(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return isCircleAvatar ?? true
        ? AppCircleAvatar(
          radius: radius,
          imageSource: imageSource,
          pickedFile: pickedFile,
        )
        : AppRectangleAvatar(
          radius: radius,
          imageSource: imageSource,
          pickedFile: pickedFile,
        );
  }

  void _openFullScreenViewer(BuildContext context) {
    final hasContent = pickedFile != null || imageSource != null;
    if (!hasContent) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => FullScreenImageViewer(
              imageSource: imageSource,
              pickedFile: pickedFile,
              heroTag: heroTag,
            ),
      ),
    );
  }
}
