import 'package:json_annotation/json_annotation.dart';
import 'package:rpp/features/notice/data/model/news_api_model.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  final int? total;
  final int? totalPages;
  final List<NewsApiModel>? data; // Allow nullable list

  NewsResponse({
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
