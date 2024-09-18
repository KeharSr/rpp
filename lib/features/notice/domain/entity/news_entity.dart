import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final int id;
  final String slug;
  final String title;
  final String content;
  final String imageUrl;
  final String categoryName;
  final String createdAt;
  final String authorName;
  final String authorAvatarUrl;
  final String url;

  const NewsEntity({
    required this.id,
    required this.slug,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.categoryName,
    required this.createdAt,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.url,
  });

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
