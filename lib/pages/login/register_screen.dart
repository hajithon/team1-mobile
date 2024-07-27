import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_form_field.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';
import 'package:hajithon_teami_flutter_app/pages/onboarding/pages/profile.dart';
import 'package:hajithon_teami_flutter_app/services/auth/service.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';

  final Rx<String> email = Rx('');
  final Rx<String> password = Rx('');
  final Rx<String> passwordDoubleCheck = Rx('');
  final Rx<bool> isLoading = false.obs;

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: [
                const Text(
                  '더 좋은 아침을 만날 준비 됐나요?',
                  style: TextStyles.titleTextStyle,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  '회원정보를 입력해주세요',
                  style: TextStyles.subTitleTextStyle,
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        label: '이메일',
                        hintText: 'example@email.com',
                        onChanged: (value) {
                          email.value = value;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      CustomTextFormField(
                        label: '비밀번호',
                        hintText: '숫자 포함 영문 10글자 이상',
                        obscureText: true,
                        onChanged: (value) {
                          password.value = value;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      CustomTextFormField(
                        label: '비밀번호 확인',
                        hintText: '비밀번호를 한 번 더 입력해주세요',
                        obscureText: true,
                        onChanged: (value) {
                          passwordDoubleCheck.value = value;
                        },
                      ),
                    ],
                  ),
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
              if (email.value.isNotEmpty && password.value.isNotEmpty && password.value == passwordDoubleCheck.value) {
                return CustomButton(
                  child: const Text('완료'),
                  onTap: () async {
                    try {
                      isLoading.value = true;
                      await Get.find<AuthService>().register(email.value, password.value);
                      Get.offAllNamed(ProfileOnoboardingScreen.routeName);
                    } finally {
                      isLoading.value = false;
                    }
                  },
                );
              }
              return CustomButton.disabled(child: const Text('완료'));
            }),
          ),
        ],
      ),
    );
  }
}
