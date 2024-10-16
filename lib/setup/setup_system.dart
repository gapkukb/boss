import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future setupSystem() async {
  if (Platform.isAndroid) {
    //设置沉浸式状态栏(Status Bar)

    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
