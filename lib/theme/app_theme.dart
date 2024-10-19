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

  appBarTheme: AppBarTheme(
    backgroundColor: spotlightColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.red,
      // fontSize: 64.sp,
    ),
    // iconTheme: IconThemeData(
    //   // color: Colors.white,
    //   size: 48.w,
    // ),
  ),
);
