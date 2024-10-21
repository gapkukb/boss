import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BossGutter extends StatelessWidget {
  /** 4 */
  static final double MINI = 8.r;
  /** 8 */
  static final double SMALL = 16.r;
  /** 16 */
  static final double MEDIUM = 32.r;
  /** 24 */
  static final double LARGE = 48.r;
  /** 32 */
  static final double XLARGE = 64.r;
  /** 40 */
  static final double XXLARGE = 80.r;
  /** 48 */
  static final double XXXLARGE = 96.r;

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
  BossGutter.mini({super.key}) : size = MINI;
  /** 8 */
  BossGutter.small({super.key}) : size = SMALL;
  /** 16 */
  BossGutter.medium({super.key}) : size = MEDIUM;
  /** 24 */
  BossGutter.large({super.key}) : size = LARGE;
  /** 32 */
  BossGutter.xlarge({super.key}) : size = XLARGE;
  /** 40 */
  BossGutter.xxlarge({super.key}) : size = XXLARGE;
  /** 48 */
  BossGutter.xxxlarge({super.key}) : size = XXXLARGE;
}
