import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/core/middleware/login.dart';
import 'package:hajithon_teami_flutter_app/pages/home/home_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/login/landing_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/login/login_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/login/register_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/test/page.dart';

class AppPages {
  static final pages = [
    GetPage(name: TestScreen.routeName, page: () => const TestScreen()),
    GetPage(name: LandingScreen.routeName, page: () => const LandingScreen()),
    GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
    GetPage(name: RegisterScreen.routeName, page: () => const RegisterScreen()),
    GetPage(name: HomeScreen.routeName, page: () => const HomeScreen(), middlewares: [LoginMiddleware()]),
  ];
}
