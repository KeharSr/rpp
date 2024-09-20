import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/app/constant/api_endpoints.dart';
import 'package:rpp/core/failure/failure.dart';
import 'package:rpp/core/networking/remote/http_service.dart';
import 'package:rpp/core/shared_prefs/user_shared_prefs.dart';
import 'package:rpp/features/auth/data/dto/get_current_user_dto.dart';
import 'package:rpp/features/auth/data/model/auth_api_model.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';

final authDataSourceProvider = Provider((ref) => AuthDataSource(
    dio: ref.read(httpServiceProvider),
    authApiModel: ref.read(authApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider)));

class AuthDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  final AuthApiModel authApiModel;

  AuthDataSource(
      {required this.dio,
      required this.userSharedPrefs,
      required this.authApiModel});

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
        final token = response.data['token'];
        await userSharedPrefs.setUserToken(token);
        return const Right(true);
      } else {
        return Left(Failure(error: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.error.toString()));
    }
  }

  // get me
  Future<Either<Failure, AuthEntity>> getMe() async {
    try {
      String? token;
      // Debug: Checking if token retrieval from shared prefs works
      var data = await userSharedPrefs.getUserToken();

      data.fold(
        (l) {
          token = null;
          print("Error getting token from shared preferences: ${l.error}");
        },
        (r) {
          token = r;
          print("Token successfully retrieved: $token");
        },
      );

      // Check if the token is null before proceeding
      if (token == null) {
        print("No token found. Aborting API request.");
        return Left(Failure(error: "User token not found"));
      }

      print('Making API call to: ${ApiEndpoints.getMe}');

      // Make the API request
      var response = await dio.get(
        ApiEndpoints.getMe,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Debug: Response status code
      print('Response status code: ${response.statusCode}');

      // Debug: Full response data
      print('Response data: ${response.data}');

      // Check if the API call was successful
      if (response.statusCode == 200 && response.data != null) {
        print("API call successful. Parsing response...");

        // Parse the response into the DTO
        final getCurrentUserDto = GetCurrentUserDto.fromJson(response.data);

        print("DTO parsed successfully: ${getCurrentUserDto.data}");

        // Convert DTO to entity
        return Right(getCurrentUserDto.data.toEntity());
      } else {
        print(
            "API call failed. Status code: ${response.statusCode}, Message: ${response.data['message']}");

        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      // Debug: Catching Dio-specific exceptions
      print("DioException occurred: ${e.error}");
      print("DioException details: ${e.message}");

      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    } catch (e) {
      // Debug: Catching any other general exceptions
      print("An unexpected error occurred: ${e.toString()}");

      return Left(
        Failure(
          error: e.toString(),
        ),
      );
    }
  }

  // update me
  Future<Either<Failure, bool>> updateMe(AuthEntity updateMe) async {
    try {
      String? token;
      // Debug: Checking if token retrieval from shared prefs works
      var data = await userSharedPrefs.getUserToken();

      data.fold(
        (l) {
          token = null;
          print("Error getting token from shared preferences: ${l.error}");
        },
        (r) {
          token = r;
          print("Token successfully retrieved: $token");
        },
      );

      // Check if the token is null before proceeding
      if (token == null) {
        print("No token found. Aborting API request.");
        return Left(Failure(error: "User token not found"));
      }

      print('Making API call to: ${ApiEndpoints.updateMe}');

      // Make the API request
      var response = await dio.post(
        ApiEndpoints.updateMe,
        data: authApiModel.fromEntity(updateMe).toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Debug: Response status code
      print('Response status code: ${response.statusCode}');

      // Debug: Full response data
      print('Response data: ${response.data}');

      // Check if the API call was successful
      if (response.statusCode == 200 && response.data != null) {
        print("API call successful. Parsing response...");

        // Check if the status is true
        if (response.data['status'] == true) {
          return const Right(true);
        } else {
          return Left(Failure(error: response.data['message']));
        }
      } else {
        print(
            "API call failed. Status code: ${response.statusCode}, Message: ${response.data['message']}");

        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      // Debug: Catching Dio-specific exceptions
      print("DioException occurred: ${e.error}");
      print("DioException details: ${e.message}");

      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    } catch (e) {
      // Debug: Catching any other general exceptions
      print("An unexpected error occurred: ${e.toString()}");

      return Left(
        Failure(
          error: e.toString(),
        ),
      );
    }
  }
}
