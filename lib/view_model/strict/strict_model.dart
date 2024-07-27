// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';

enum WakeUpState {
  sleeping,
  wakeUp,
  quizCompleted,
  wakeUpLate,
}

extension WakeUpStateExtension on WakeUpState {
  Color get color {
    switch (this) {
      case WakeUpState.sleeping:
        return grey300;
      case WakeUpState.wakeUp:
        return orangeBright;
      case WakeUpState.quizCompleted:
        return primaryColor;
      case WakeUpState.wakeUpLate:
        return brownLight;
    }
  }
}

class StrictModel {
  final DateTime date;
  final WakeUpState? wakeUpState;

  StrictModel({
    required this.date,
    required this.wakeUpState,
  });
}
