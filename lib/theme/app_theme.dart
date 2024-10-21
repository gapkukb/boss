import 'package:boss/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final appTheme = ThemeData(
  primaryColor: spotlightColor,
  // brightness: Brightness.dark,

  textTheme: TextTheme(
    bodyLarge: TextStyle(),
  ),

  listTileTheme: ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16.0.r,
    ),
    minTileHeight: 56.r,
  ),
);
