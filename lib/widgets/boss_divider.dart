import 'package:flutter/material.dart';

class BossDivider extends StatelessWidget {
  final double? thickness;
  final double? gap;
  final String? text;
  final Color? textColor;
  final Widget? textWiget;

  const BossDivider({
    Key? key,
    this.thickness,
    this.gap,
    this.text,
    this.textWiget,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            thickness: thickness,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: gap ?? 8.0),
          child: textWiget ?? (text != null ? Text(text!, style: TextStyle(color: textColor)) : null),
        ),
        Expanded(
          child: Divider(
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}
