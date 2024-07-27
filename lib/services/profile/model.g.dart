// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String,
      profileImage: json['profile'] as String?,
      nickname: json['nickname'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'profile': instance.profileImage,
      'nickname': instance.nickname,
      'description': instance.description,
    };
