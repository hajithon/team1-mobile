import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_form_field.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';

class ColumnFormFieldWidget extends StatelessWidget {
  final String label;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final bool obscureText;

  const ColumnFormFieldWidget({
    super.key,
    required this.label,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyles.titleTextStyle.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8.0),
        CustomTextFormField(
          onChanged: onChanged,
          hintText: hintText,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
