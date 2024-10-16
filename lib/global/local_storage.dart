part of 'global.dart';

class LocalStorage {
  LocalStorage._();

  static late final SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
