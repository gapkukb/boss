library global;

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';

part 'env.dart';
part 'local_storage.dart';
part 'device.dart';

class Global {
  Global._();

  static const env = _Env;
  static late final SharedPreferences prefs;
  static final _Device device = _Device();

  static Future setup() async {
    prefs = await SharedPreferences.getInstance();
    await device.init();
  }
}
