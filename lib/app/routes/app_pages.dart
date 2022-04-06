import 'package:get/get.dart';
import 'package:pharma/app/modules/home/home_binding.dart';
import 'package:pharma/app/modules/home/home_page.dart';
import 'package:pharma/app/modules/splash/splash_binding.dart';
import 'package:pharma/app/modules/splash/splash_page.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static final routes = [
    //SPLASH PAGE
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    // HOME PAGE
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
