import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusable_image_widget/constants/avatar_style_constants.dart';
import 'package:reusable_image_widget/view_models/image_picker_cubit/image_picker_cubit.dart';
import 'package:reusable_image_widget/views/widgets/image_viewer/app_rectangle_avatar.dart';
import 'package:reusable_image_widget/views/widgets/full_screen_viewer/full_screen_image_viewer.dart';
import 'package:reusable_image_widget/views/widgets/full_screen_viewer/hero_wrapper.dart';

import '../../../constants/default_image_path.dart';
import '../image_viewer/app_circle_avatar.dart';
import 'edit_avatar_icon.dart';

class AvatarImageViewer extends StatelessWidget {
  const AvatarImageViewer({
    super.key,
    // this.pickedFile,
    this.imageSource = kProfileIconPath,
    this.radius = AvatarStyleConstants.defaultRadius,
    this.heroTag,
    this.showEditIcon = true,
    this.isCircleAvatar,
    this.onTapEdit,
    this.editIcon,
  });

  // final XFile? pickedFile;
  final String? imageSource;
  final double radius;
  final String? heroTag;
  final bool showEditIcon;
  final bool? isCircleAvatar;
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
    return isCircleAvatar ?? true
        ? AppCircleAvatar(radius: radius, imageSource: imageSource)
        : AppRectangleAvatar(radius: radius, imageSource: imageSource);
  }

  void _openFullScreenViewer(BuildContext context) {
    // ✅ Use pickedFile from cubit if not provided
    final XFile? pickedFile =
        (context.read<ImagePickerCubit>().state is ImagePickerSuccess
            ? (context.read<ImagePickerCubit>().state as ImagePickerSuccess)
                .pickedFile
            : null);
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
