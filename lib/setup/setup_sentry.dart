import 'dart:async';

import 'package:sentry_flutter/sentry_flutter.dart';

const SENTRY_DSN = const String.fromEnvironment('SENTRY_DSN');

Future setupSentry() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = SENTRY_DSN;
      options.autoAppStart = false;
    },
  );
}
