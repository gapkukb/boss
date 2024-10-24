import 'package:flutter/material.dart';

import 'app_theme.dart';

final lightTheme = appTheme.copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: Colors.transparent,
    // modalBarrierColor: Colors.white,
  ),
);
