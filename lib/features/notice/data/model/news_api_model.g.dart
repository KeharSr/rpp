// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsApiModel _$NewsApiModelFromJson(Map<String, dynamic> json) => NewsApiModel(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      image_url: json['image_url'] as String?,
      category_name: json['category_name'] as String?,
      createdAt: json['createdAt'] as String?,
      authorName: json['authorName'] as String?,
      authorAvatarUrl: json['authorAvatarUrl'] as String?,
      url: json['url'] as String?,
      imageId: json['imageId'] as String?,
      category_id: (json['category_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NewsApiModelToJson(NewsApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'content': instance.content,
      'image_url': instance.image_url,
      'category_name': instance.category_name,
      'createdAt': instance.createdAt,
      'authorName': instance.authorName,
      'authorAvatarUrl': instance.authorAvatarUrl,
      'url': instance.url,
      'imageId': instance.imageId,
      'category_id': instance.category_id,
    };
