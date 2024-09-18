import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/app/constant/api_endpoints.dart';
import 'package:rpp/core/failure/failure.dart';
import 'package:rpp/core/networking/remote/http_service.dart';
import 'package:rpp/features/notice/data/dto/news_response.dart';
import 'package:rpp/features/notice/data/model/news_api_model.dart';
import 'package:rpp/features/notice/domain/entity/news_entity.dart';

final newsDataSourceProvider = Provider((ref) => NewsDataSource(
    dio: ref.read(httpServiceProvider),
    newsApiModel: ref.read(newsApiModelProvider)));

class NewsDataSource {
  final Dio dio;
  final NewsApiModel newsApiModel;

  NewsDataSource({required this.dio, required this.newsApiModel});

  Future<Either<Failure, List<NewsEntity>>> getNews() async {
    try {
      final response = await dio.get(ApiEndpoints.news);

      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        // Parse the response using NewsResponse DTO
        final newsDto = NewsResponse.fromJson(response.data);

        // If the data list is not null, convert to entity list, else return an empty list
        if (newsDto.data != null) {
          return Right(newsApiModel.toEntityList(newsDto.data!));
        } else {
          return const Right([]); // Return an empty list if data is null
        }
      } else {
        // Handle unsuccessful responses
        return Left(
          Failure(
            error: response.data['message'] ?? 'Unknown error',
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      print('DioException: ${e.message}');
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    } catch (e) {
      // Catch any other exceptions
      print('Exception: ${e.toString()}');
      return Left(
        Failure(
          error: e.toString(),
        ),
      );
    }
  }
}
