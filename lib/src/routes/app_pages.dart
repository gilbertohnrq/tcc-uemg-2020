import 'package:ezj_app/src/bindings/app_binding.dart';
import 'package:ezj_app/src/bindings/login_binding.dart';
import 'package:ezj_app/src/pages/home_page.dart';
import 'package:ezj_app/src/pages/login_page.dart';
import 'package:ezj_app/src/pages/splash_page.dart';
import 'package:ezj_app/src/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.INITIAL, page: () => SplashPage(), binding: AppBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(
        name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
  ];
}
