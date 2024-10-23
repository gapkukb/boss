import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'locales/app_locales.dart';
import 'routes/pages.dart';
import 'theme/app_theme.dart';
import 'pages/home/index.dart';
import 'pages/layout/index.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //填入设计稿中设备的屏幕尺寸,单位dp
    return ScreenUtilInit(
      designSize: const Size(750, 1336),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initalRoute,
          theme: lightTheme,
          darkTheme: dartTheme,
          themeMode: ThemeMode.system,
          translationsKeys: AppLocales.translations,
          defaultTransition: Transition.rightToLeftWithFade,
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          getPages: AppPages.pages,
          // home: child,
          // builder: (context, child) {
          //   child = EasyLoading.init()(context, child);
          //   return Scaffold(
          //     drawer: UserDrawerPage(),
          //     body: child,
          //   );
          // },
          builder: EasyLoading.init(),
        );
      },
      child: HomePage(),
    );
  }
}
