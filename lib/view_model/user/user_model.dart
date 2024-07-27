import 'package:hajithon_teami_flutter_app/view_model/strict/strict_model.dart';

/// 타인에 대한 유저 모델
class UserModel {
  final String uid;
  final String profileImageUrl;
  final String name;
  final WakeUpState state;

  const UserModel({
    required this.uid,
    required this.profileImageUrl,
    required this.name,
    required this.state,
  });
}
