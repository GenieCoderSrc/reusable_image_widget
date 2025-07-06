import 'package:flutter/material.dart';
import 'package:online_indicator/online_indicators.dart';

import '../app_circle_avatar.dart';
import '../../../constants/image_style_constant.dart';

class CircleAvatarWithOnlineIndicator extends StatelessWidget {
  final Function? onTap;
  final bool isOnline;
  final Color? indicatorBGColor;
  final Color? indicatorBorderColor;
  final Color? iconColor;
  final IconData? iconData;
  final bool shadow;
  final bool border;
  final String? imageSource;
  final double imgRadius;
  final double indicatorRadius;
  final double indicatorBorderRadius;

  const CircleAvatarWithOnlineIndicator({
    super.key,
    this.onTap,
    this.isOnline = false,
    this.indicatorBGColor,
    this.indicatorBorderColor,
    this.imageSource,
    this.shadow = true,
    this.border = false,
    this.iconColor,
    this.iconData,
    this.imgRadius = kRadius,
    this.indicatorRadius = 15.0,
    this.indicatorBorderRadius = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(border ? 2 : 0),
            decoration: BoxDecoration(
              border: border
                  ? Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    )
                  : null,
              shape: BoxShape.circle,
              boxShadow: shadow
                  ? <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ]
                  : null,
            ),
            child: AppCircleAvatar(imageSource: imageSource, radius: imgRadius),
          ),
          OnlineIndicator(
            bgColor: indicatorBGColor,
            isOnline: isOnline,
            iconData: iconData,
            iconColor: iconColor,
            borderColor: indicatorBorderColor,
            radius: indicatorRadius,
            borderWide: indicatorBorderRadius,
          )
        ],
      ),
    );
  }
}
