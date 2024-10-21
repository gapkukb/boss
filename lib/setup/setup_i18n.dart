import 'dart:convert';
import 'dart:io';

Future setupI18N() async {
  final process = await Process.start('dart run "./plugin/i18n_generate.dart"', []);
  await process.stdout.transform(utf8.decoder).forEach(print);
}
