import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:nil/nil.dart';

class XIcon extends StatelessWidget {
  final dynamic icon;
  final double size;
  final double? padding;
  final Color? color;
  final Color? fgcolor;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;

  const XIcon({
    Key? key,
    this.icon,
    this.size = 24,
    this.color,
    this.fgcolor,
    this.padding,
    this.borderRadius,
    this.onTap,
    this.shape = BoxShape.circle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon == null) return nil;
    late final Widget _icon;
    final Color? _color = fgcolor ?? (color != null ? Colors.white : null);
    final double _padding = padding ?? size / 5;

    if (icon is IconData) {
      _icon = Icon(
        icon,
        color: _color,
        size: size - _padding * 2,
      );
    } else if (icon is String) {
      _icon = Iconify(
        icon,
        color: _color,
        size: size - _padding * 2,
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
        width: size,
        height: size,
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
          );
  }
}
