import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';
import 'package:hajithon_teami_flutter_app/pages/home/home_screen.dart';

class GroupCreateCompleteScreen extends StatelessWidget {
  static const String routeName = '/create/group_create_complete';

  const GroupCreateCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '그룹 만들기',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 이미지
                Image.network(
                  'https://postfiles.pstatic.net/MjAxNzAyMDFfMiAg/MDAxNDg1OTI4NzEwODk0.q4x6Rqfa_wlB6k5nqvXRvsge6DKwuRDPgIGui_XZX04g.kP1gxUWmKX4M5iZEV5u2jFkTwapObhn3KPFpGpDPAfkg.PNG.chowin21/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2017-02-01_%EC%98%A4%ED%9B%84_2.57.34.png?type=w773',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  '그룹이 만들어졌어요!',
                  style: TextStyles.titleTextStyle,
                ),
                const SizedBox(height: 4.0),
                Text(
                  '이제 함께 더 좋은 아침들을 만들어가요',
                  style: TextStyles.subTitleTextStyle.copyWith(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            text: '홈으로',
            onPressed: () => Get.offAllNamed(HomeScreen.routeName),
          )
        ],
      ),
    );
  }
}
