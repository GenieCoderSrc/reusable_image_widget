import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:reusable_image_widget/constants/avatar_style_constants.dart';
import 'package:reusable_image_widget/views/widgets/app_rectangle_avatar.dart';
import 'package:reusable_image_widget/views/widgets/hero_wrapper.dart';

import '../../../constants/default_image_path.dart';
import '../../screens/full_screen_image_viewer.dart';
import '../app_circle_avatar.dart';
import 'edit_avatar_icon.dart';

class AvatarImageViewer extends StatelessWidget {
  const AvatarImageViewer({
    super.key,
    this.imageFile,
    this.imageBytes,
    this.imageSource = kProfileIconPath,
    this.radius = AvatarStyleConstants.defaultRadius,
    this.heroTag,
    this.showEditIcon = true,
    this.isCircleAvatar = true,
    this.onTapEdit,
    this.editIcon,
  });

  final File? imageFile;
  final Uint8List? imageBytes;
  final String? imageSource;
  final double radius;
  final String? heroTag;
  final bool showEditIcon;
  final bool isCircleAvatar;
  final VoidCallback? onTapEdit;
  final Widget? editIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => _openFullScreenViewer(context),
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
                  child: editIcon ?? const EditAvatarIcon(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return isCircleAvatar
        ? AppCircleAvatar(
          radius: radius,
          imageFile: imageFile,
          imageBytes: imageBytes,
          imageSource: imageSource,
        )
        : AppRectangleAvatar(
          radius: radius,
          imageFile: imageFile,
          imageBytes: imageBytes,
          imageSource: imageSource,
        );
  }

  void _openFullScreenViewer(BuildContext context) {
    final hasContent =
        imageFile != null || imageBytes != null || imageSource != null;
    if (!hasContent) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => FullScreenImageViewer(
              image: imageFile,
              imageBytes: imageBytes,
              imageSource: imageSource,
              heroTag: heroTag,
            ),
      ),
    );
  }
}
