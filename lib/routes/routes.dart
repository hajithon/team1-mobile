import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/core/middleware/login.dart';
import 'package:hajithon_teami_flutter_app/pages/group/group_create/group_create_complete_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/group/group_create/group_create_name_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/group/group_create/group_create_time_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/home/binding.dart';
import 'package:hajithon_teami_flutter_app/pages/home/home_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/login/landing_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/login/login_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/login/register_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/onboarding/pages/binding.dart';
import 'package:hajithon_teami_flutter_app/pages/onboarding/pages/profile.dart';
import 'package:hajithon_teami_flutter_app/pages/quiz/news_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/quiz/quiz_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/test/page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: TestScreen.routeName,
      page: () => const TestScreen(),
    ),
    GetPage(
      name: LandingScreen.routeName,
      page: () => const LandingScreen(),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RegisterScreen.routeName,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: HomePageBinding(),
      middlewares: [LoginMiddleware()],
    ),
    GetPage(
      name: GroupCreateNameScreen.routeName,
      page: () => const GroupCreateNameScreen(),
    ),
    GetPage(
      name: GroupCreateTimeScreen.routeName,
      page: () => const GroupCreateTimeScreen(),
    ),
    GetPage(
      name: GroupCreateCompleteScreen.routeName,
      page: () => const GroupCreateCompleteScreen(),
    ),
    GetPage(
      name: ProfileOnoboardingScreen.routeName,
      page: () => ProfileOnoboardingScreen(),
      middlewares: [LoginMiddleware()],
      binding: OnboardingPageBinding(),
    ),
    GetPage(
      name: NewsScreen.routeName,
      page: () => const NewsScreen(),
    ),
    GetPage(
      name: QuizScreen.routeName,
      page: () => const QuizScreen(),
    ),
  ];
}
