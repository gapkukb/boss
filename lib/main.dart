import 'package:boss/locales/app_locales.dart';
import 'package:boss/pages/Splash/SplashView.dart';
import 'package:boss/routes/pages.dart';
import 'package:boss/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'global/global.dart';
import 'pages/layout/index.dart';
import 'pages/layout/widgets/bottom_navigator/index.dart';
import 'pages/layout/widgets/drawer/index.dart';
import 'setup/index.dart';
import 'widgets/x_icon.dart';

void main() async {
  setupSystem();
  setupEasyLoading();

  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    setupHttpCertificate(),
    setupSentry(),
    Global.setup(),
  ]);

  SentryFlutter.setAppStartEnd(DateTime.now());

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initalRoute,
          theme: appTheme,
          translationsKeys: AppLocales.translations,
          defaultTransition: Transition.rightToLeftWithFade,
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          getPages: AppPages.pages,
          home: SplashView(),
          // builder: (context, child) {
          //   child = EasyLoading.init()(context, child);
          //   return Scaffold(
          //     drawer: UserDrawerPage(),
          //     body: child,
          //   );
          // },
          builder: EasyLoading.init(
            builder: (context, child) {
              return LayoutPage();
            },
          ),
        );
      },
    ),
  );
}
