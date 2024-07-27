import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_form_field.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';

class GroupCreateTimeScreen extends StatelessWidget {
  static const String routeName = '/create/group_create_time';

  const GroupCreateTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '보람찬 아침을 위한\n푸쉬알림 시간을 설정해주세요',
            style: TextStyles.titleTextStyle,
          ),
          const SizedBox(
            height: 28.0,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('오전', style: TextStyles.titleTextStyle),
              SizedBox(
                width: 60,
                child: CustomTextFormField(
                  onChanged: (value) {},
                  hintText: '00',
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text('시', style: TextStyles.titleTextStyle),
              SizedBox(
                width: 60,
                child: CustomTextFormField(
                  onChanged: (value) {},
                  hintText: '00',
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text('분', style: TextStyles.titleTextStyle),
            ],
          )),
          CustomElevatedButton(
            text: '다음',
            onPressed: () => Get.toNamed(
              GroupCreateTimeScreen.routeName,
            ),
          ),
        ],
      ),
    );
  }
}
