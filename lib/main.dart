import 'package:boss/locales/app_locales.dart';
import 'package:boss/pages/Splash/SplashView.dart';
import 'package:boss/routes/pages.dart';
import 'package:boss/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'setup/index.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: appTheme,
    translationsKeys: AppLocales.translations,
    defaultTransition: Transition.rightToLeftWithFade,
    locale: Locale('en', 'US'),
    fallbackLocale: Locale('en', 'US'),
    getPages: AppPages.pages,
    home: SplashView(),
    builder: EasyLoading.init(),
  ));
}
