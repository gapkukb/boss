import 'package:boss/pages/Home/HomeView.dart';
import 'package:boss/pages/Splash/SplashView.dart';
import 'package:boss/pages/account/login.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
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
      page: () => LoginView(),
    )
  ];
}
