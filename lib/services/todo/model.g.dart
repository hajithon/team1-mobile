// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      id: (json['id'] as num).toInt(),
      userId: (json['user'] as num).toInt(),
      title: json['title'] as String,
      done: json['status'] as bool,
      todoDate: DateTime.parse(json['todo_date'] as String),
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.userId,
      'title': instance.title,
      'status': instance.done,
      'todo_date': instance.todoDate.toIso8601String(),
    };
