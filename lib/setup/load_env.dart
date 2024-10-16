import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future loadENV() async {
  // await dotenv.load(fileName: ".env");
  // const env = String.fromEnvironment("env", defaultValue: 'dev');
  // await dotenv.load(fileName: ".env");

  // dotenv.env['VAR_NAME'];

  print("object11111111111111111111111");
  print(const String.fromEnvironment('APP_NAME'));
  print(const String.fromEnvironment('MODE'));
  print(const String.fromEnvironment('API_HOST'));
}
