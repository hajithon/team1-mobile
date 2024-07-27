import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';
import 'package:hajithon_teami_flutter_app/pages/login/login_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/login/register_screen.dart';

class LandingScreen extends StatelessWidget {
  static const String routeName = '/';

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomElevatedBotton(
            text: '이메일로 시작하기',
            onPressed: () => context.pushNamed(
              RegisterScreen.routeName,
            ),
          ),
          const SizedBox(height: 4.0),
          CustomWhiteElevatedButton(
            text: '로그인하기',
            onPressed: () => context.pushNamed(
              LoginScreen.routeName,
            ),
          ),
        ],
      ),
    );
  }
}
