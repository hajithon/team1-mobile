// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wake _$WakeFromJson(Map<String, dynamic> json) => Wake(
      wakeTime: DateTime.parse(json['wake_date'] as String),
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$WakeToJson(Wake instance) => <String, dynamic>{
      'wake_date': instance.wakeTime.toIso8601String(),
      'status': instance.status,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String,
      profileImage: json['profile'] as String?,
      nickname: json['nickname'] as String,
      description: json['description'] as String,
      wakes: (json['wakes'] as List<dynamic>?)
          ?.map((e) => Wake.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'profile': instance.profileImage,
      'nickname': instance.nickname,
      'description': instance.description,
      'wakes': instance.wakes,
    };
