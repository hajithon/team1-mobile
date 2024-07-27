import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_form_field.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';

class ProfileOnoboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding/profile';
  const ProfileOnoboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '프로필을 설정해주세요',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              radius: 66,
                              backgroundColor: Color(0xFFD9D8D7),
                              foregroundImage: AssetImage('asset/default_profile.png'),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                  width: 42,
                                  height: 42,
                                  padding: const EdgeInsets.all(9),
                                  decoration: ShapeDecoration(
                                    color: primaryColor,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(width: 2, color: Color(0xFFFEFEFE)),
                                      borderRadius: BorderRadius.circular(21),
                                    ),
                                  ),
                                  child: SvgPicture.asset('asset/add_photo.svg')),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      CustomTextFormField(
                        label: '닉네임',
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 32),
                      CustomTextFormField(
                        label: '한 마디',
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CustomButton(
                child: Text('완료'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
