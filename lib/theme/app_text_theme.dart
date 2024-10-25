import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static final displayLarge = TextStyle(fontSize: 28.sp, color: Colors.black);
  static final displayMedium = TextStyle(fontSize: 28.sp, color: Colors.black);
  static final displaySmall = TextStyle(fontSize: 24.sp, color: Colors.black);

  static final headlineLarge = TextStyle(fontSize: 28.sp, color: Colors.black);
  static final headlineMedium = TextStyle(fontSize: 28.sp, color: Colors.black);
  static final headlineSmall = TextStyle(fontSize: 28.sp, color: Colors.black);

  static final titleLarge = TextStyle(fontSize: 28.sp, color: Colors.black);
  static final titleMedium = TextStyle(fontSize: 28.sp, color: Colors.black);
  static final titleSmall = TextStyle(fontSize: 28.sp, color: Colors.black);

  static final bodyLarge = TextStyle(fontSize: 28.sp, color: Colors.black);
  static final bodyMedium = TextStyle(fontSize: 28.sp, color: Colors.black);
  static final bodySmall = TextStyle(fontSize: 28.sp, color: Colors.black);

  static final labelLarge = TextStyle(fontSize: 28.sp, color: Colors.black);
  static final labelMedium = TextStyle(fontSize: 28.sp, color: Colors.black);
  static final labelSmall = TextStyle(fontSize: 28.sp, color: Colors.black);

  static TextTheme get light {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }

  static TextTheme get dark {
    return TextTheme(
      displayLarge: displayLarge.copyWith(color: Colors.white),
      displayMedium: displayMedium.copyWith(color: Colors.white),
      displaySmall: displaySmall.copyWith(color: Colors.white),
      headlineLarge: headlineLarge.copyWith(color: Colors.white),
      headlineMedium: headlineMedium.copyWith(color: Colors.white),
      headlineSmall: headlineSmall.copyWith(color: Colors.white),
      titleLarge: titleLarge.copyWith(color: Colors.white),
      titleMedium: titleMedium.copyWith(color: Colors.white),
      titleSmall: titleSmall.copyWith(color: Colors.white),
      bodyLarge: bodyLarge.copyWith(color: Colors.white),
      bodyMedium: bodyMedium.copyWith(color: Colors.white),
      bodySmall: bodySmall.copyWith(color: Colors.white),
      labelLarge: labelLarge.copyWith(color: Colors.white),
      labelMedium: labelMedium.copyWith(color: Colors.white),
      labelSmall: labelSmall.copyWith(color: Colors.white),
    );
  }
}
