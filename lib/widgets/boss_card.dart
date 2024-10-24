import 'package:flutter/material.dart';
import '../../widgets/boss_gutter.dart';
import '../../widgets/boss_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BossCard extends StatelessWidget {
  final Widget? title;
  final String? titleText;
  final Widget? footer;
  final EdgeInsets? padding;
  final Widget body;

  const BossCard({
    super.key,
    this.title,
    this.titleText,
    this.footer,
    this.padding,
    required this.body,
  }) : assert(title != null || titleText != null);

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title ??
            BossText(
              text: titleText!,
              fontSize: 48.sp,
            ),
        BossGutter.small(),
        body,
        if (footer != null) footer!
      ],
    );
    if (padding != null) {
      child = Padding(
        padding: padding!,
        child: child,
      );
    }
    return Card.outlined(
      margin: EdgeInsets.zero,
      child: child,
    );
  }
}
