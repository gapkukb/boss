library setup;

import './easy_loading.dart';
import './http_certificate.dart';

Future<void> setup() async {
  setupEasyLoading();
  await setupHttpSecurity();
}
