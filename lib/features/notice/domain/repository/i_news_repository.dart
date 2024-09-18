import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/core/failure/failure.dart';
import 'package:rpp/features/notice/data/data_source/news_data_source.dart';
import 'package:rpp/features/notice/domain/entity/news_entity.dart';

final newsRepositoryProvider =
    Provider((ref) => ref.read(newsRemoteRepositoryProvider));

abstract class INewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getNews();
}

final newsRemoteRepositoryProvider =
    Provider<INewsRepository>((ref) => NewsRemoteRepository(
          newsDataSource: ref.read(newsDataSourceProvider),
        ));

class NewsRemoteRepository implements INewsRepository {
  final NewsDataSource newsDataSource;

  NewsRemoteRepository({required this.newsDataSource});

  @override
  Future<Either<Failure, List<NewsEntity>>> getNews() {
    return newsDataSource.getNews();
  }
}
