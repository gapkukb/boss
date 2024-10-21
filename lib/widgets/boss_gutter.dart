import 'package:flutter/material.dart';

class BossGutter extends StatelessWidget {
  /** 4 */
  static const double MINI = 4;
  /** 8 */
  static const double SMALL = 8;
  /** 16 */
  static const double MEDIUM = 16;
  /** 24 */
  static const double LARGE = 24;
  /** 32 */
  static const double XLARGE = 32;
  /** 40 */
  static const double XXLARGE = 40;
  /** 48 */
  static const double XXXLARGE = 48;

  final double size;

  const BossGutter({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }

  /** 4 */
  const BossGutter.mini({super.key}) : size = MINI;
  /** 8 */
  const BossGutter.small({super.key}) : size = SMALL;
  /** 16 */
  const BossGutter.medium({super.key}) : size = MEDIUM;
  /** 24 */
  const BossGutter.large({super.key}) : size = LARGE;
  /** 32 */
  const BossGutter.xlarge({super.key}) : size = XLARGE;
  /** 40 */
  const BossGutter.xxlarge({super.key}) : size = XXLARGE;
  /** 48 */
  const BossGutter.xxxlarge({super.key}) : size = XXXLARGE;
}
