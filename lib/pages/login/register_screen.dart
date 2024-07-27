import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hajithon_teami_flutter_app/component/common/column_form_field_widget.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          const Expanded(
            child: const Column(
              children: [
                ColumnFormFieldWidget(
                  label: '이메일',
                  hintText: 'example@email.com',
                ),
                SizedBox(height: 24.0),
                ColumnFormFieldWidget(
                  label: '비밀번호',
                  hintText: '숫자 포함 영문 10글자 이상',
                  obscureText: true,
                ),
                SizedBox(height: 24.0),
                ColumnFormFieldWidget(
                  label: '비밀번호 확인',
                  hintText: '비밀번호를 한 번 더 입력해주세요',
                  obscureText: true,
                ),
              ],
            ),
          ),
          CustomElevatedBotton(
            text: '완료',
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
