import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_form_field.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';
import 'package:hajithon_teami_flutter_app/pages/group/group_create/group_create_complete_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/home/home_screen.dart';
import 'package:hajithon_teami_flutter_app/services/group/model.dart';
import 'package:hajithon_teami_flutter_app/services/group/service.dart';

class GroupCreateTimeScreen extends StatelessWidget {
  final String groupName = Get.arguments['groupName'] ?? '';
  final Rx<bool> isLoading = false.obs;
  final Rx<String> hour = ''.obs;
  final Rx<String> minute = ''.obs;
  static const String routeName = '/create/group_create_time';

  GroupCreateTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '그룹 만들기',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '보람찬 아침을 위한\n푸쉬알림 시간을 설정해주세요',
            style: TextStyles.titleTextStyle,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('오전', style: TextStyles.titleTextStyle),
                SizedBox(
                  width: 60,
                  child: CustomTextFormField(
                    onChanged: (value) {
                      hour.value = value;
                    },
                    hintText: '00',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Text('시', style: TextStyles.titleTextStyle),
                SizedBox(
                  width: 60,
                  child: CustomTextFormField(
                    onChanged: (value) {
                      minute.value = value;
                    },
                    hintText: '00',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Text('분', style: TextStyles.titleTextStyle),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Obx(() {
              if (isLoading.value) {
                return CustomButton.loading();
              }
              if (hour.value.isEmpty || minute.value.isEmpty) {
                return CustomButton.disabled(child: const Text('완료'));
              }
              return CustomButton(
                child: const Text('다음'),
                onTap: () async {
                  try {
                    isLoading.value = true;
                    log('sadfdsjafl');
                    await Get.find<GroupService>().createGroup(groupName, Time(hour: int.parse(hour.value), minute: int.parse(minute.value)));
                    Get.offAllNamed(GroupCreateCompleteScreen.routeName);
                  } finally {
                    isLoading.value = false;
                  }
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
