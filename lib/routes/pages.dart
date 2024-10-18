import 'package:get/get.dart';
import '../pages/login/index.dart';
import '../pages/pin/pin.dart';
import '../pages/user/profile/index.dart';
import '../pages/home/index.dart';
import '../pages/splash/index.dart';
import '../pages/recommendation/index.dart';

part './routes.dart';

abstract class AppPages {
  static const initalRoute = Routes.HOME;

  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
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
    GetPage(
      name: Routes.RECOMMENDATION,
      page: () => RecommendationPage(),
    ),
  ];
}
