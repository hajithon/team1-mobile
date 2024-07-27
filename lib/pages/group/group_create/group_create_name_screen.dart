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
  String groupName = '';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '그룹의 이름을 입력해주세요.',
            style: TextStyles.titleTextStyle,
          ),
          const SizedBox(
            height: 60.0,
          ),
          Expanded(
            child: CustomTextFormField(
              onChanged: (value) {
                setState(() {
                  groupName = value;
                });
              },
              hintText: '한글 또는 영문 10자 이내의 이름을 작성해주세요',
            ),
          ),
          CustomElevatedButton(
            text: '다음',
            onPressed: () => Get.toNamed(GroupCreateTimeScreen.routeName),
          ),
        ],
      ),
    );
  }
}
