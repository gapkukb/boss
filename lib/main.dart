import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'global/global.dart';
import 'setup/index.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupSystem();
  setupEasyLoading();
  await Future.wait([
    setupHttpCertificate(),
    setupSentry(),
    Global.setup(),
  ]);

  SentryFlutter.setAppStartEnd(DateTime.now());

  runApp(App());
  // runApp(app);
}
