import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/component/common/column_form_field_widget.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

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
                        ColumnFormFieldWidget(
                          label: '이메일',
                          hintText: 'example@email.com',
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                        const SizedBox(height: 36.0),
                        ColumnFormFieldWidget(
                          label: '비밀번호',
                          hintText: '비밀번호를 입력해주세요.',
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const CustomElevatedBotton(
                    text: '로그인하기',
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
