import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Wake {
  @JsonKey(name: 'wake_date')
  final DateTime wakeTime;
  final int status;

  Wake({
    required this.wakeTime,
    required this.status,
  });

  factory Wake.fromJson(Map<String, dynamic> json) => _$WakeFromJson(json);
  Map<String, dynamic> toJson() => _$WakeToJson(this);
}

@JsonSerializable()
class Profile {
  final int? id;
  final String email;
  @JsonKey(name: 'profile')
  final String? profileImage;
  final String nickname;
  final String description;
  final List<Wake>? wakes;

  Profile({
    this.id,
    required this.email,
    required this.profileImage,
    required this.nickname,
    required this.description,
    this.wakes,
  });

  Wake? getTodayWake() {
    return wakes?.firstWhereOrNull(
      (wake) {
        DateTime now = DateTime.now();
        return now.year == wake.wakeTime.year && now.month == wake.wakeTime.month && now.day == wake.wakeTime.day;
      },
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
