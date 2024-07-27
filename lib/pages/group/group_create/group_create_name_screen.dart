import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_form_field.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';
import 'package:hajithon_teami_flutter_app/pages/group/group_create/group_create_time_screen.dart';

class GroupCreateNameScreen extends StatefulWidget {
  static const String routeName = '/create/group_screate_name';

  const GroupCreateNameScreen({super.key});

  @override
  State<GroupCreateNameScreen> createState() => _GroupCreateNameScreenState();
}

class _GroupCreateNameScreenState extends State<GroupCreateNameScreen> {
  final Rx<String> groupName = Rx('');

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  const Text(
                    '그룹의 이름을 입력해주세요.',
                    style: TextStyles.titleTextStyle,
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  CustomTextFormField(
                    onChanged: (value) {
                      groupName.value = value;
                    },
                    hintText: '한글 또는 영문 10자 이내의 이름을 작성해주세요',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Obx(() {
                if (groupName.value.isEmpty) {
                  return CustomButton.disabled(child: const Text('다음'));
                }
                return CustomButton(
                  child: const Text('다음'),
                  onTap: () {
                    Get.toNamed(GroupCreateTimeScreen.routeName, arguments: {'groupName': groupName.value});
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
