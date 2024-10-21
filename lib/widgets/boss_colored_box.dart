import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BossColoredBox extends StatelessWidget {
  final double? size;
  final double? width;
  final double? height;
  final Widget? child;
  final MaterialType type;
  final double elevation;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final TextStyle? textStyle;
  final ShapeBorder shape;
  final bool borderOnForeground;
  final Clip clipBehavior;
  final Duration animationDuration;
  final BorderRadiusGeometry? borderRadius;

  const BossColoredBox({
    super.key,
    this.width,
    this.height,
    this.size,
    this.type = MaterialType.canvas,
    this.elevation = 0.0,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.textStyle,
    this.borderRadius,
    this.shape = const CircleBorder(),
    this.borderOnForeground = true,
    this.clipBehavior = Clip.none,
    this.animationDuration = kThemeChangeDuration,
    this.child,
  });

  // @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? size,
      height: height ?? size,
      child: Material(
        color: color,
        shape: shape,
        child: child,
        animationDuration: animationDuration,
        borderOnForeground: borderOnForeground,
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        elevation: elevation,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        textStyle: textStyle,
        type: type,
      ),
    );
  }
}
