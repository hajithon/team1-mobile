import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/pages/login/landing_screen.dart';
import 'package:hajithon_teami_flutter_app/services/auth/service.dart';

class LoginMiddleware extends GetMiddleware {
  final AuthService authService = Get.find<AuthService>();

  LoginMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return authService.isLoggedIn ? null : const RouteSettings(name: LandingScreen.routeName);
  }
}
