import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'boss_gutter.dart';

class BossActionSheet extends StatelessWidget {
  final List<BossActionSheetItem> children;
  final VoidCallback? onCancel;
  final void Function(BossActionSheetItem)? onChoose;

  const BossActionSheet({
    super.key,
    required this.children,
    this.onCancel,
    this.onChoose,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(16.r),
              child: Material(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: children.map((child) {
                    return GestureDetector(
                      onTap: () {
                        Get.back(
                          result: child.id,
                        );
                        if (!child.enabled) return;
                        child.onTap!();
                        onChoose?.call(child);
                      },
                      child: AbsorbPointer(
                        absorbing: true,
                        child: child,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            BossGutter.small(),
            BossActionSheetItem(
              id: "cancel",
              title: "Cancel",
              rounded: true,
              onTap: _onCancel,
            ),
          ],
        ),
      ),
    );
  }

  _onCancel() {
    Get.back();
    onCancel?.call();
  }
}

class BossActionSheetItem extends ListTile {
  static final _defaultBorder = Border(
    bottom: BorderSide(
      color: Colors.grey,
      width: 1.r,
      style: BorderStyle.solid,
      strokeAlign: BorderSide.strokeAlignInside,
    ),
  );
  static final _roundedBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
  );

  final String id;

  BossActionSheetItem({
    Key? key,
    required this.id,
    final String? subtitle,
    final dynamic icon,
    final Color? textColor,
    final bool rounded = false,
    final TextStyle titleTextStyle = const TextStyle(),
    required String title,
    required VoidCallback onTap,
    super.enabled,
    super.trailing,
    super.minLeadingWidth,
    super.titleAlignment,
  }) : super(
          key: key,
          shape: rounded ? _roundedBorder : _defaultBorder,
          tileColor: Colors.white,
          selectedTileColor: Colors.grey[200],
          leading: icon == null
              ? null
              : Icon(
                  icon,
                  size: 48.r,
                ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: titleTextStyle.copyWith(
              color: enabled ? textColor : Colors.grey,
              fontSize: 32.sp,
            ),
          ),
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle,
                  style: TextStyle(fontSize: 24.sp, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
          minTileHeight: 112.r,
          onTap: onTap,
        );
}
