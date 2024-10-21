import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'global/global.dart';
import 'setup/index.dart';
import 'app.dart';

void main() async {
  setupSystem();
  setupEasyLoading();

  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    setupHttpCertificate(),
    setupSentry(),
    setupI18N(),
    Global.setup(),
  ]);

  SentryFlutter.setAppStartEnd(DateTime.now());

  runApp(App());
  // runApp(app);
}
