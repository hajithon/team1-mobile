import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofucus;
  final String? label;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.errorText,
    this.label,
    this.obscureText = false,
    this.autofucus = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(label!),
              )
            : Container(),
        TextField(
          obscureText: obscureText,
          autofocus: autofucus,
          onChanged: onChanged,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            filled: true,
            fillColor: inputBackgroundColor,
            counterText: "",
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            hintText: hintText,
            errorText: errorText,
            hintStyle: TextStyles.hintTextStyle,
          ),
        ),
      ],
    );
  }
}
