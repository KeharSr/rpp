import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/app/constant/api_endpoints.dart';
import 'package:rpp/core/failure/failure.dart';
import 'package:rpp/core/networking/remote/http_service.dart';

final authDataSourceProvider =
    Provider((ref) => AuthDataSource(dio: ref.read(httpServiceProvider)));

class AuthDataSource {
  final Dio dio;

  AuthDataSource({required this.dio});

  // login
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {
          'email': email,
          'password': password,
          'device_name': 'mobile',
        },
      );

      if (response.data['status'] == 1) {
        return const Right(true);
      } else {
        return Left(Failure(error: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.error.toString()));
    }
  }
}
