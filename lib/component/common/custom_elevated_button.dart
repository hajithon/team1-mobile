import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';

class CustomElevatedBotton extends StatelessWidget {
  final VoidCallback? onPressed;

  final String text;

  final Color? backgroundColor;

  final Color? textColor;

  final double? fontSize;

  const CustomElevatedBotton({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          text,
          style: TextStyles.titleTextStyle.copyWith(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 18.0,
          ),
        ),
      ),
    );
  }
}

class CustomWhiteElevatedButton extends CustomElevatedBotton {
  const CustomWhiteElevatedButton({
    super.key,
    super.onPressed,
    required super.text,
    Color? backgroundColor,
    Color? textColor,
    super.fontSize,
  }) : super(
          backgroundColor: backgroundColor ?? Colors.white,
          textColor: textColor ?? primaryColor,
        );
}
