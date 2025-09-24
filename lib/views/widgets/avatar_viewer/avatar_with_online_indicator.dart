import 'package:flutter/material.dart';
import 'package:online_indicator/online_indicators.dart';

import 'app_avatar.dart';

class AvatarWithOnlineIndicator extends StatelessWidget {
  const AvatarWithOnlineIndicator({
    super.key,
    this.onTap,
    this.isOnline = false,
    this.indicatorBGColor,
    this.indicatorBorderColor,
    this.imageSource,
    this.shadow = true,
    this.border = false,
    this.isCircleAvatar = true,
    this.iconColor,
    this.iconData,
    this.imgRadius = 40.0,
    this.indicatorRadius = 15.0,
    this.indicatorBorderRadius = 1.0,
    this.backgroundColor,
  });

  final VoidCallback? onTap;
  final bool isOnline;
  final bool isCircleAvatar;

  final Color? indicatorBGColor;
  final Color? indicatorBorderColor;

  final String? imageSource;

  final bool shadow;
  final bool border;

  final Color? backgroundColor;

  final Color? iconColor;
  final IconData? iconData;

  final double imgRadius;
  final double indicatorRadius;
  final double indicatorBorderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(imgRadius),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(border ? 2 : 0),
            decoration: BoxDecoration(
              border:
                  border
                      ? Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      )
                      : null,
              shape: BoxShape.circle,
              boxShadow:
                  shadow
                      ? <BoxShadow>[
                        BoxShadow(
                          // color: Colors.grey.withAlpha((0.5 * 255).round()),
                          color: Colors.grey.withValues(alpha: 128),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ]
                      : null,
            ),
            child: AppAvatar(
              isCircle: isCircleAvatar,
              imageSource: imageSource,
              radius: imgRadius,
              placeholderIcon: iconData ?? Icons.person,
              backgroundColor: backgroundColor,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: OnlineIndicator(
              bgColor: indicatorBGColor,
              isOnline: isOnline,
              iconData: iconData,
              iconColor: iconColor,
              borderColor: indicatorBorderColor,
              radius: indicatorRadius,
              borderWide: indicatorBorderRadius,
            ),
          ),
        ],
      ),
    );
  }
}
