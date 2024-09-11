import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/app/constant/api_endpoints.dart';
import 'package:rpp/core/failure/failure.dart';
import 'package:rpp/core/networking/remote/http_service.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';

final authDataSourceProvider =
    Provider((ref) => AuthDataSource(dio: ref.read(httpServiceProvider)));

class AuthDataSource {
  final Dio dio;

  AuthDataSource({required this.dio});

  // register
  Future<Either<Failure, bool>> register(
      {required AuthEntity entity, required bool term}) async {
    try {
      final response = await dio.post(
        ApiEndpoints.register,
        data: {
          'email': entity.email,
          'password': entity.password,
          'first_name': entity.firstName,
          'last_name': entity.lastName,
          'term': term,
        },
      );

      if (response.data['status'] == true) {
        return const Right(true);
      } else {
        return Left(Failure(error: response.data['message'].toString()));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.error.toString()));
    }
  }

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
