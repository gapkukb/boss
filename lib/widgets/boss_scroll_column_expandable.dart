import 'package:flutter/material.dart';

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BossScrollColumnExpandable extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final VerticalDirection verticalDirection;
  final BoxDecoration? decoration;

  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final EdgeInsetsGeometry padding;

  const BossScrollColumnExpandable({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.verticalDirection = VerticalDirection.down,
    this.padding = const EdgeInsets.all(0),
    this.textDirection,
    this.textBaseline,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[const SizedBox(width: double.infinity)];

    if (this.children != null) children.addAll(this.children);
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: Container(
            padding: padding,
            constraints: BoxConstraints(
              minHeight: constraint.maxHeight - padding.vertical,
            ),
            decoration: decoration,
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: MainAxisSize.max,
                verticalDirection: verticalDirection,
                children: children,
                textBaseline: textBaseline,
                textDirection: textDirection,
              ),
            ),
          ),
        );
      },
    );
  }
}
