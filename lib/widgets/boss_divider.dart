import 'package:flutter/material.dart';

class BossDivider extends StatelessWidget {
  final double? thickness;
  final double? gap;
  final double? fontSize;
  final String? text;
  final Color? color;
  final Color? lineColor;

  const BossDivider({
    Key? key,
    this.thickness,
    this.gap,
    this.text,
    this.color,
    this.fontSize,
    this.lineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final line = Expanded(
      child: Divider(
        thickness: thickness ?? 0.5,
        color: lineColor ?? color,
      ),
    );
    return Row(
      children: <Widget>[
        line,
        if (text != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gap ?? 8.0),
            child: Text(
              text!,
              style: TextStyle(
                fontSize: fontSize,
                color: color,
              ),
            ),
          ),
        line,
      ],
    );
  }
}
