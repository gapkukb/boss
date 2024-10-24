import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';

enum ARROW_TYPE {
  RIGHT,
  LEFT,
  DOWN,
  UP,
  NONE,
  ;

  IconData get _icon {
    if (this == ARROW_TYPE.LEFT) return Icons.keyboard_arrow_left;
    if (this == ARROW_TYPE.UP) return Icons.keyboard_arrow_up;
    if (this == ARROW_TYPE.DOWN) return Icons.keyboard_arrow_down;
    return Icons.keyboard_arrow_right;
  }

  Icon get icon {
    return Icon(
      this._icon,
      size: 48.sp,
    );
  }
}

class BossCell extends ListTile {
  final Widget? value;
  final Widget? extra;
  final ARROW_TYPE arrowType;

  BossCell({
    Key? key,
    super.leading,
    super.title,
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
    super.contentPadding,
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
    super.minTileHeight,
    super.titleAlignment,
    this.arrowType = ARROW_TYPE.RIGHT,
    this.value,
    this.extra,
  }) : super(
          key: key,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value != null) value,
              if (extra != null) extra,
              if (extra == null && arrowType != ARROW_TYPE.NONE) arrowType.icon,
            ],
          ),
        );
}

class BossCellGroup extends StatelessWidget {
  final List<Widget> children;
  final Color borderColor;
  final double? borderRadius;

  const BossCellGroup({
    Key? key,
    required this.children,
    this.borderColor = Colors.grey,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgets = children.expandIndexed((index, child) {
      if (index == children.length - 1) return [child];
      return [child, Divider(height: 0, thickness: 0.5)];
    }).toList();

    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.5, color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }
}
