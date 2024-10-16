library global;

import 'package:shared_preferences/shared_preferences.dart';

part 'env.dart';
part './local_storage.dart';

class Global {
  Global._();

  static const env = _Env;
  static late final SharedPreferences prefs;

  static Future setup() async {
    prefs = await SharedPreferences.getInstance();
  }
}
