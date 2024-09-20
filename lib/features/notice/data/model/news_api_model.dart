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
  final String? imageUrl;
  final String? categoryName;
  final String? createdAt;
  final String? authorName;
  final String? authorAvatarUrl;
  final String? url;
  final String? imageId;

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
    this.imageId,
  });

  const NewsApiModel.empty()
      : id = 0,
        slug = null,
        title = null,
        content = null,
        imageUrl = null,
        categoryName = null,
        createdAt = null,
        authorName = null,
        authorAvatarUrl = null,
        url = null,
        imageId = null;

  // Convert API object to Entity object
  factory NewsApiModel.fromJson(Map<String, dynamic> json) =>
      _$NewsApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsApiModelToJson(this);

  NewsEntity toEntity() {
    return NewsEntity(
      id: id,
      slug: slug ?? '',
      title: title ?? '',
      content: content ?? '',
      imageUrl: imageUrl ?? '',
      categoryName: categoryName ?? '',
      createdAt: createdAt ?? '',
      authorName: authorName ?? '',
      authorAvatarUrl: authorAvatarUrl ?? '',
      url: url ?? '',
      imageId: imageId ?? '',
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
      imageId: entity.imageId,
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
        imageId,
      ];
}
