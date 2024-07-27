import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';

class TextStyles {
  /// Font size: 28, FontWeight: 600, Color: titleTextColor
  static const titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: titleTextColor,
  );

  /// Font size: 20, FontWeight: 500, Color: titleTextColor
  static const subTitleTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: subtitleTextColor,
  );

  /// Font size: 16, FontWeight: 400, Color: inputHintTextColor
  static const hintTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: inputHintColor,
  );

  /// Font size: 16, FontWeight: 400, Color: descriptionTextColor
  static const descriptionTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    // color: descriptionTextColor,
  );
}
