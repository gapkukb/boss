import 'dart:math';

import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  final double radius;
  MyClipper({
    required this.radius,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();
    final x = size.width / 2 - radius / 2;
    final y = radius / 2;

    path.moveTo(0, y);
    path.lineTo(x, y);

    path.arcTo(Rect.fromCenter(center: Offset(size.width / 2, y), width: radius, height: radius), 0, -pi, true);
    path.lineTo(size.width, y);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, y);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
