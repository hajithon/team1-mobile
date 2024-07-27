import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_form_field.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';
import 'package:hajithon_teami_flutter_app/pages/home/home_screen.dart';
import 'package:hajithon_teami_flutter_app/services/auth/service.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Rx<String> email = Rx('');
  final Rx<String> password = Rx('');
  final Rx<bool> isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      safeAreaDisabled: true,
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '로그인하기',
                    style: TextStyles.titleTextStyle,
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    '회원정보를 입력해주세요.',
                    style: TextStyles.subTitleTextStyle,
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                          label: '이메일',
                          hintText: 'example@email.com',
                          onChanged: (value) {
                            email.value = value;
                          },
                        ),
                        const SizedBox(height: 36.0),
                        CustomTextFormField(
                          label: '비밀번호',
                          hintText: '비밀번호를 입력해주세요.',
                          obscureText: true,
                          onChanged: (value) {
                            password.value = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Obx(() {
                      if (isLoading.value) {
                        return CustomButton.loading();
                      }
                      if (email.value.isNotEmpty && password.value.isNotEmpty) {
                        return CustomButton(
                          child: const Text('로그인'),
                          onTap: () async {
                            try {
                              isLoading.value = true;

                              await Get.find<AuthService>().login(email.value, password.value);
                              Get.offAllNamed(HomeScreen.routeName);
                            } finally {
                              isLoading.value = false;
                            }
                          },
                        );
                      }
                      return CustomButton.disabled(
                        child: const Text('로그인'),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
