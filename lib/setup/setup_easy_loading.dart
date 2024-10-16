import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

setupEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.dark
    ..maskType = EasyLoadingMaskType.custom
    ..indicatorSize = 32.0
    ..lineWidth = 3.0
    ..fontSize = 12.0
    ..contentPadding = EdgeInsets.all(16.0)
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
