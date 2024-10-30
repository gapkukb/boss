library global;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'env.dart';
// part 'local_storage.dart';
part 'device.dart';

class Global {
  Global._();

  static const env = _Env;
  // static late final SharedPreferences prefs;
  static final _Device device = _Device();

  static Future setup() async {
    // prefs = await SharedPreferences.getInstance();
    await device.init();
  }

  static toast(String message) {
    EasyLoading.showToast(
      message,
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.none,
    );
  }
}
