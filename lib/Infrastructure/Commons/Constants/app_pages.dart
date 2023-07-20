import 'package:get/get.dart';
import 'package:newsapp/Infrastructure/Commons/Constants/route_constants.dart';

import '../../../UI/Screens/HomeScreen/Binding/home_binding.dart';
import '../../../UI/Screens/HomeScreen/View/home_screen.dart';
import '../../../UI/Screens/SplashScreen/Binding/splash_binding.dart';
import '../../../UI/Screens/SplashScreen/View/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RouteConstants.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteConstants.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
