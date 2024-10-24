import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Sen',
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
