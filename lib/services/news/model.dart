import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class News {
  final int id;
  final String title;
  final String url;
  final String summary;
  @JsonKey(name: 'published_at')
  final DateTime publishedAt;
  final String keyword;

  News({
    required this.id,
    required this.title,
    required this.url,
    required this.summary,
    required this.publishedAt,
    required this.keyword,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
