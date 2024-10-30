import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputDecorationTheme {
  AppInputDecorationTheme._();

  static final hintStyle = TextStyle(
    color: Colors.grey.shade400,
    fontSize: 28.sp,
  );

  static final underlineBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade100, width: 1.r),
  );

  static InputDecorationTheme get light {
    return InputDecorationTheme(
      hintStyle: hintStyle,
      border: underlineBorder,
      fillColor: Colors.white,
      filled: true,
    );
  }

  static InputDecorationTheme get dark {
    return InputDecorationTheme(
      hintStyle: hintStyle,
      border: underlineBorder,
    );
  }
}
