import 'package:boss/pages/Home/HomeView.dart';
import 'package:boss/pages/Splash/SplashView.dart';
import 'package:boss/pages/login/index.dart';
import 'package:boss/pages/pin/pin.dart';
import 'package:boss/pages/user/profile/index.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static const initalRoute = Routes.PROFILE;

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
    ),
    GetPage(
      name: Routes.PIN,
      page: () => PinPut(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => UserProfilePage(),
    ),
  ];
}
