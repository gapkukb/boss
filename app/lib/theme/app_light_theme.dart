import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_input_decoration_theme.dart';
import 'app_text_theme.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Sen',
  scaffoldBackgroundColor: Colors.white,
  cupertinoOverrideTheme: CupertinoThemeData(
    scaffoldBackgroundColor: Colors.white,
  ),
  textTheme: AppTextTheme.light,
  inputDecorationTheme: AppInputDecorationTheme.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: Colors.transparent,
    // modalBarrierColor: Colors.white,
  ),
  dividerTheme: DividerThemeData(color: Colors.grey.shade300, space: 0, thickness: 1.r),
);
