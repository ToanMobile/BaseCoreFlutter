import 'package:core/page/home/binding/home_binding.dart';
import 'package:core/page/home/home_page.dart';
import 'package:core/page/login/binding/login_binding.dart';
import 'package:core/page/login/login_page.dart';
import 'package:core/page/splash/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      binding: LoginBinding(),
      page: () => LoginPage(),
    ),
    GetPage(name: AppRoutes.HOME, page: () => HomePage(), binding: HomeBinding(), children: [
      /*GetPage(
        name: AppRoutes.PATH_DETAIL_ITEM,
        page: () => DetailsPage(),
        binding: DetailBinding(),
      ),*/
    ]),
  ];
}
