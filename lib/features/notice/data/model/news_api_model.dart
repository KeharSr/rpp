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
  final String? image_url;
  final String? category_name;
  final String? createdAt;
  final String? authorName;
  final String? authorAvatarUrl;
  final String? url;
  final String? imageId;
  final int? category_id;

  const NewsApiModel({
    required this.id,
    this.slug,
    this.title,
    this.content,
    this.image_url,
    this.category_name,
    this.createdAt,
    this.authorName,
    this.authorAvatarUrl,
    this.url,
    this.imageId,
    this.category_id,
  });

  const NewsApiModel.empty()
      : id = 0,
        slug = null,
        title = null,
        content = null,
        image_url = null,
        category_name = null,
        createdAt = null,
        authorName = null,
        authorAvatarUrl = null,
        url = null,
        category_id = 0,
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
      image_url: image_url ?? '',
      category_name: category_name ?? '',
      createdAt: createdAt ?? '',
      authorName: authorName ?? '',
      authorAvatarUrl: authorAvatarUrl ?? '',
      url: url ?? '',
      imageId: imageId ?? '',
      category_id: category_id ?? 0,
    );
  }

  // Convert Entity to API object
  factory NewsApiModel.fromEntity(NewsEntity entity) {
    return NewsApiModel(
      id: entity.id,
      slug: entity.slug,
      title: entity.title,
      content: entity.content,
      image_url: entity.image_url,
      category_name: entity.category_name,
      createdAt: entity.createdAt,
      authorName: entity.authorName,
      authorAvatarUrl: entity.authorAvatarUrl,
      url: entity.url,
      imageId: entity.imageId,
      category_id: entity.category_id,
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
        image_url,
        category_name,
        createdAt,
        authorName,
        authorAvatarUrl,
        url,
        imageId,
        category_id,
      ];
}
