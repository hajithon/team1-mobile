import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Todo {
  final int? id;
  @JsonKey(name: 'user_id')
  final int userId;
  final String title;
  @JsonKey(name: 'status')
  final bool done;
  @JsonKey(name: 'todo_date')
  final DateTime todoDate;

  Todo({
    this.id,
    required this.userId,
    required this.title,
    required this.done,
    required this.todoDate,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
