import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'locales/app_locales.dart';
import 'routes/pages.dart';
import 'theme/app_theme.dart';
import 'pages/home/index.dart';
import 'pages/layout/index.dart';

final app = ScreenUtilInit(
  designSize: const Size(750, 1334),
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
      home: HomePage(),
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
);
