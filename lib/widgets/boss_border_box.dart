import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BossBorderBox extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? thickness;
  final double? radius;
  final EdgeInsets? padding;

  const BossBorderBox({
    super.key,
    this.child,
    this.color,
    this.thickness,
    this.radius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Widget? _child = child;
    if (this.padding != null && child != null) {
      _child = Padding(
        padding: padding!,
        child: child,
      );
    }
    return Material(
      type: MaterialType.transparency,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: color ?? Colors.red,
            width: thickness ?? 1.r,
          ),
          borderRadius: BorderRadius.circular(radius ?? 8.r),
        ),
        child: _child,
      ),
    );
  }
}
