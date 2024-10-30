import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_input_decoration_theme.dart';
import 'app_text_theme.dart';

final dartTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Sen',
  scaffoldBackgroundColor: Colors.black,
  cupertinoOverrideTheme: CupertinoThemeData(
    scaffoldBackgroundColor: Colors.black,
  ),
  textTheme: AppTextTheme.dark,
  inputDecorationTheme: AppInputDecorationTheme.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: Colors.transparent,
    // modalBarrierColor: Colors.white,
  ),
);
