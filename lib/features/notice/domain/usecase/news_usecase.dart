import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/core/failure/failure.dart';
import 'package:rpp/features/notice/domain/entity/news_entity.dart';
import 'package:rpp/features/notice/domain/repository/i_news_repository.dart';

final newsUsecaseProvider = Provider((ref) => NewsUseCase(
      newsRepository: ref.read(newsRepositoryProvider),
    ));

class NewsUseCase {
  final INewsRepository newsRepository;

  NewsUseCase({required this.newsRepository});

  Future<Either<Failure, List<NewsEntity>>> getNews() async {
    return await newsRepository.getNews();
  }

  // Get news by id
  Future<Either<Failure, NewsEntity>> getNewsById(int id) async {
    return await newsRepository.getNewsById(id);
  }
}
