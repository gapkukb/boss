import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nil/nil.dart';
import 'dart:ui' as ui show TextHeightBehavior;

class BossText extends StatelessWidget {
  final double? maxWidth;
  final double? minWidth;
  final double? minHeight;
  final double? maxHeight;
  final TextStyle style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final String text;
  final EdgeInsets? padding;
  final Color? color;
  final Color? bgcolor;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Widget? before;
  final Widget? after;

  const BossText({
    super.key,
    required this.text,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    this.style = const TextStyle(),
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis,
    this.semanticsLabel,
    this.selectionColor,
    this.maxWidth,
    this.minWidth,
    this.padding,
    this.color,
    this.bgcolor,
    this.borderRadius,
    this.minHeight,
    this.maxHeight,
    this.onTap,
    this.before,
    this.after,
  });

  BossText.ellipsis({
    super.key,
    required this.text,
    this.locale,
    this.maxLines = 1,
    // this.overflow,
    this.softWrap,
    this.strutStyle,
    this.style = const TextStyle(),
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis,
    this.semanticsLabel,
    this.selectionColor,
    this.maxWidth,
    this.minWidth,
    this.padding,
    this.color,
    this.bgcolor,
    this.borderRadius,
    this.minHeight,
    this.maxHeight,
    this.onTap,
    this.after,
    this.before,
  }) : overflow = TextOverflow.ellipsis;

  @override
  Widget build(BuildContext context) {
    Widget view = Text(
      text,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      strutStyle: strutStyle,
      style: style.copyWith(color: color),
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
      semanticsLabel: semanticsLabel,
      selectionColor: selectionColor,
    );

    if (padding != null) {
      view = Padding(padding: padding!, child: view);
    }

    if (bgcolor != null || borderRadius != null) {
      view = PhysicalModel(
        color: bgcolor!,
        borderRadius: borderRadius,
        child: view,
      );
    }

    if (maxWidth != null || minWidth != null || minHeight != null || maxHeight != null) {
      view = ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minWidth ?? 0.0,
          maxWidth: maxWidth ?? double.infinity,
          minHeight: minHeight ?? 0.0,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: view,
      );
    }

    if (before != null || after != null) {
      // view = Row(
      //   children: [
      //     before ?? nil,
      //     view,
      //     after ?? nil,
      //   ],
      // );
    }

    if (onTap != null) {
      view = GestureDetector(
        onTap: onTap,
        child: view,
      );
    }

    return view;
  }
}
