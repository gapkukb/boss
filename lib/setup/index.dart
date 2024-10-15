library setup;

import './easy_loading.dart';
import './http_certificate.dart';
import './load_env.dart';

Future<void> setup() async {
  setupEasyLoading();
  await setupHttpSecurity();
  await loadENV();
}
