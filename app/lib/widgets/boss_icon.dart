import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:nil/nil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BossIcon extends StatelessWidget {
  final dynamic icon;
  final double? size;
  final double? padding;
  final Color? color;
  final Color? fgcolor;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;

  const BossIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.fgcolor,
    this.padding,
    this.borderRadius,
    this.onTap,
    this.shape = BoxShape.circle,
  });

  @override
  Widget build(BuildContext context) {
    if (icon == null) return nil;
    final _size = size ?? 48.sp;
    late final Widget _icon;
    final Color? _color = fgcolor ?? (color != null ? Colors.white : null);
    final double _padding = padding ?? _size / 5;

    if (icon is IconData) {
      _icon = Icon(
        icon,
        color: _color,
        size: _size - _padding * 2,
      );
    } else if (icon is String) {
      _icon = Iconify(
        icon,
        color: _color,
        size: _size - _padding * 2,
      );
    } else if (icon is Widget) {
      _icon = icon;
    } else {
      throw "icon must a iconData or String or Widget";
    }

    final view = DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: shape,
        borderRadius: borderRadius,
      ),
      child: SizedBox(
        width: _size,
        height: _size,
        child: Padding(
          padding: EdgeInsets.all(_padding),
          child: _icon,
        ),
      ),
    );

    return onTap == null
        ? view
        : InkWell(
            onTap: onTap,
            child: view,
            borderRadius: BorderRadius.circular(100),
          );
  }
}
