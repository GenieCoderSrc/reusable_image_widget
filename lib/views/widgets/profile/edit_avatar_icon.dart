import 'package:flutter/material.dart';
import 'package:reusable_image_widget/constants/avatar_style_constants.dart';

class EditAvatarIcon extends StatelessWidget {
  const EditAvatarIcon({
    super.key,
    this.icon = Icons.add_a_photo,
    this.iconSize = 16,
    this.iconColor,
    this.backgroundColor,
    this.elevation = 2,
    this.padding = const EdgeInsets.all(4),
  });

  final IconData icon;
  final double iconSize;
  final Color? iconColor;
  final Color? backgroundColor;
  final double elevation;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: backgroundColor,
      shape: const CircleBorder(),
      margin: AvatarStyleConstants.editIconCardMargin,
      child: Padding(
        padding: padding ?? AvatarStyleConstants.editIconPadding,
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor ?? Colors.grey.shade600,
        ),
      ),
    );
  }
}
