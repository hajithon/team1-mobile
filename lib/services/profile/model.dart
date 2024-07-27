import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Profile {
  final int? id;
  final String email;
  @JsonKey(name: 'profile')
  final String? profileImage;
  final String nickname;
  final String description;

  Profile({
    this.id,
    required this.email,
    required this.profileImage,
    required this.nickname,
    required this.description,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
