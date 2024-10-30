part of 'global.dart';

enum _AppEnv {
  dev,
  fat,
  uat,
  prod,
  ;

  static fromEnv(String dotenv) {
    return _AppEnv.values.firstWhere((item) => item.toString().split(".").last == dotenv);
  }

  bool get isDev => this == _AppEnv.dev;
  bool get isFat => this == _AppEnv.fat;
  bool get isUat => this == _AppEnv.uat;
  bool get isProd => this == _AppEnv.prod;
}

class _Env {
  _Env._();

  static const String APP_NAME = String.fromEnvironment('APP_NAME');
  static final _AppEnv APP_ENV = _AppEnv.fromEnv(const String.fromEnvironment('APP_ENV'));
  static const bool APP_DEBUG = bool.fromEnvironment('APP_DEBUG');
  static const String API_SECRET = String.fromEnvironment('API_SECRET');
  static const String API_KEY = String.fromEnvironment('API_KEY');
  static const String API_URL = String.fromEnvironment('API_URL');
}
