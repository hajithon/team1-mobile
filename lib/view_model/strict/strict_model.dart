// ignore_for_file: public_member_api_docs, sort_constructors_first
enum WakeUpState {
  sleeping,
  wakeUp,
  quizCompleted,
  wakeUpLate,
}

class StrictModel {
  final DateTime date;
  final WakeUpState? wakeUpState;

  StrictModel({
    required this.date,
    required this.wakeUpState,
  });
}
