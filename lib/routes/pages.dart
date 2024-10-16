import 'package:boss/pages/Home/HomeView.dart';
import 'package:boss/pages/Splash/SplashView.dart';
import 'package:boss/pages/login/index.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static const initalRoute = Routes.LOGIN;
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashView(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.LOGIN,
      binding: LoginBinding(),
      page: () => LoginPage(),
    )
  ];
}
