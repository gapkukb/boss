import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';

import 'boss_gutter.dart';
import 'boss_text.dart';

enum ARROW_TYPE {
  RIGHT,
  LEFT,
  DOWN,
  UP,
  NONE,
  ;

  String get _icon {
    if (this == ARROW_TYPE.LEFT) return Ion.ios_arrow_left;
    if (this == ARROW_TYPE.UP) return Ion.ios_arrow_up;
    if (this == ARROW_TYPE.DOWN) return Ion.ios_arrow_down;
    return Ion.ios_arrow_right;
  }

  Iconify get icon {
    return Iconify(
      _icon,
      size: 40.sp,
      color: Colors.grey,
    );
  }
}

class BossCell extends ListTile {
  final Widget? valueWidget;
  final String? valueText;
  final Widget? titleWidget;
  final String? titleText;
  final Widget? extra;
  final ARROW_TYPE arrowType;
  final EdgeInsets? padding;
  final double? minTileHeight;

  BossCell({
    Key? key,
    super.leading,
    super.subtitle,
    super.isThreeLine = false,
    super.dense,
    super.visualDensity,
    super.shape,
    super.style,
    super.selectedColor,
    super.iconColor,
    super.textColor,
    super.titleTextStyle,
    super.subtitleTextStyle,
    super.leadingAndTrailingTextStyle,
    super.enabled = true,
    super.onTap,
    super.onLongPress,
    super.onFocusChange,
    super.mouseCursor,
    super.selected = false,
    super.focusColor,
    super.hoverColor,
    super.splashColor,
    super.focusNode,
    super.autofocus = false,
    super.tileColor,
    super.selectedTileColor,
    super.enableFeedback,
    super.horizontalTitleGap,
    super.minVerticalPadding,
    super.minLeadingWidth,
    super.titleAlignment,
    this.arrowType = ARROW_TYPE.RIGHT,
    this.valueWidget,
    this.extra,
    this.padding,
    this.minTileHeight,
    this.titleWidget,
    this.valueText,
    this.titleText,
  }) : super(
          key: key,
          minTileHeight: minTileHeight ?? 112.r,
          contentPadding: padding ??
              EdgeInsets.only(
                left: BossGutter.MEDIUM,
                right: BossGutter.SMALL,
              ),
          title: titleWidget ??
              (titleText == null
                  ? null
                  : BossText(
                      titleText,
                      color: Colors.black,
                      fontSize: 32.sp,
                    )),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (valueWidget != null || valueText != null)
                valueWidget ??
                    BossText(
                      valueText!,
                      fontSize: 28.sp,
                      color: Colors.grey,
                    ),
              if (extra != null) extra,
              BossGutter.small(),
              if (extra == null && arrowType != ARROW_TYPE.NONE) arrowType.icon,
            ],
          ),
        );
}

class BossCellGroup extends StatelessWidget {
  final List<Widget> children;
  final Color? borderColor;
  final double? borderRadius;

  const BossCellGroup({
    Key? key,
    required this.children,
    this.borderColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgets = children.expandIndexed((index, child) {
      if (index == children.length - 1) return [child];
      return [child, Divider(height: 0, thickness: 1.r)];
    }).toList();

    final widget = Column(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );

    if (borderColor == null) return widget;

    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.5, color: borderColor!),
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
      ),
      child: widget,
    );
  }
}
