import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/core/failure/failure.dart';
import 'package:rpp/features/auth/data/data_source/auth_data_source.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';
import 'package:rpp/features/auth/domain/repository/i_auth_repository.dart';

final authRemoteRepositoryProvider =
    Provider<IAuthRepository>((ref) => AuthRemoteRepository(
          authDataSource: ref.read(authDataSourceProvider),
        ));

class AuthRemoteRepository implements IAuthRepository {
  final AuthDataSource authDataSource;

  AuthRemoteRepository({required this.authDataSource});

  @override
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) {
    return authDataSource.login(email: email, password: password);
  }

  @override
  Future<Either<Failure, bool>> register(
      {required AuthEntity entity, required bool term}) {
    return authDataSource.register(entity: entity, term: term);
  }
}
