import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/core/failure/failure.dart';
import 'package:rpp/features/auth/data/repository/auth_remote_repository.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';

final authRepositoryProvider =
    Provider((ref) => ref.read(authRemoteRepositoryProvider));

abstract class IAuthRepository {
  Future<Either<Failure, bool>> login(
      {required String email, required String password});

  Future<Either<Failure, bool>> register(
      {required AuthEntity entity, required bool term});
}
