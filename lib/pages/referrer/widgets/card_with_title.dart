import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWithTitle extends StatelessWidget {
  final Widget body;
  final double? height;
  final Widget title;
  final Offset titleOffset;
  final EdgeInsets padding;
  final BoxDecoration? decoration;

  const CardWithTitle({
    Key? key,
    this.height,
    required this.padding,
    required this.body,
    this.decoration,
    required this.title,
    this.titleOffset = const Offset(0, 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height,
          decoration: decoration,
          padding: padding,
          child: body,
        ),
        Transform.translate(
          offset: titleOffset,
          child: Center(
            child: title,
          ),
        )
      ],
    );
  }
}
