import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rpp/features/notice/domain/entity/news_entity.dart';

part 'news_api_model.g.dart';

// Provider
final newsApiModelProvider = Provider((ref) => const NewsApiModel.empty());

@JsonSerializable()
class NewsApiModel extends Equatable {
  final int id;
  final String? slug; // Make nullable
  final String? title; // Make nullable
  final String? content; // Make nullable
  final String? imageUrl; // Make nullable
  final String? categoryName; // Make nullable
  final String? createdAt; // Make nullable
  final String? authorName; // Make nullable
  final String? authorAvatarUrl; // Make nullable
  final String? url; // Make nullable

  const NewsApiModel({
    required this.id,
    this.slug,
    this.title,
    this.content,
    this.imageUrl,
    this.categoryName,
    this.createdAt,
    this.authorName,
    this.authorAvatarUrl,
    this.url,
  });

  const NewsApiModel.empty()
      : id = 0,
        slug = '',
        title = '',
        content = '',
        imageUrl = '',
        categoryName = '',
        createdAt = '',
        authorName = '',
        authorAvatarUrl = '',
        url = '';

  // Convert API object to Entity object
  factory NewsApiModel.fromJson(Map<String, dynamic> json) =>
      _$NewsApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsApiModelToJson(this);

  NewsEntity toEntity() {
    return NewsEntity(
      id: id,
      slug: slug ?? '', // Provide default value if null
      title: title ?? '', // Provide default value if null
      content: content ?? '', // Provide default value if null
      imageUrl: imageUrl ?? '', // Provide default value if null
      categoryName: categoryName ?? '', // Provide default value if null
      createdAt: createdAt ?? '', // Provide default value if null
      authorName: authorName ?? '', // Provide default value if null
      authorAvatarUrl: authorAvatarUrl ?? '', // Provide default value if null
      url: url ?? '', // Provide default value if null
    );
  }

  // Convert Entity to API object
  factory NewsApiModel.fromEntity(NewsEntity entity) {
    return NewsApiModel(
      id: entity.id,
      slug: entity.slug,
      title: entity.title,
      content: entity.content,
      imageUrl: entity.imageUrl,
      categoryName: entity.categoryName,
      createdAt: entity.createdAt,
      authorName: entity.authorName,
      authorAvatarUrl: entity.authorAvatarUrl,
      url: entity.url,
    );
  }

  // Convert API List to Entity List
  List<NewsEntity> toEntityList(List<NewsApiModel> apiList) {
    return apiList.map((api) => api.toEntity()).toList();
  }

  List<NewsApiModel> fromEntityList(List<NewsEntity> entityList) {
    return entityList.map((entity) => NewsApiModel.fromEntity(entity)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        slug,
        title,
        content,
        imageUrl,
        categoryName,
        createdAt,
        authorName,
        authorAvatarUrl,
        url,
      ];
}
