import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final int id;
  final String slug;
  final String title;
  final String content;
  final String imageId;
  final String image_url;
  final String category_name;
  final String createdAt;
  final String authorName;
  final String authorAvatarUrl;
  final String url;
  final int category_id;

  const NewsEntity({
    required this.id,
    required this.slug,
    required this.title,
    required this.content,
    required this.image_url,
    required this.category_name,
    required this.createdAt,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.url,
    required this.imageId,
    required this.category_id,
  });

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
