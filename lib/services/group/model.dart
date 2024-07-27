import 'package:json_annotation/json_annotation.dart';
import 'package:hajithon_teami_flutter_app/services/profile/model.dart';
part 'model.g.dart';

@JsonSerializable()
class Group {
  final int id;
  final String name;
  @JsonKey(
    name: 'wake_time',
    toJson: _toJson,
    fromJson: Time.fromString,
  )
  final Time wakeTime;
  final List<Profile> users;

  Group({
    required this.id,
    required this.name,
    required this.wakeTime,
    required this.users,
  });
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  static String _toJson(Time value) => value.toString();
}

class Time {
  final int hour;
  final int minute;
  final int seconds;

  const Time({required this.hour, this.minute = 0, this.seconds = 0});

  factory Time.fromString(String str) {
    return Time(
      hour: int.parse(str.split(":")[0]),
      minute: int.parse(str.split(":")[1]),
      seconds: int.parse(str.split(":")[2]),
    );
  }

  @override
  String toString() {
    return '$hour:$minute:$seconds';
  }
}
