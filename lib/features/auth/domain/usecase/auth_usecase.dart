import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/core/failure/failure.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';
import 'package:rpp/features/auth/domain/repository/i_auth_repository.dart';

final authUsecaseProvider = Provider((ref) => AuthUsecase(
      authRepository: ref.read(authRepositoryProvider),
    ));

class AuthUsecase {
  final IAuthRepository authRepository;

  AuthUsecase({required this.authRepository});

  Future<Either<Failure, bool>> login(
      {required String email, required String password}) {
    return authRepository.login(email: email, password: password);
  }

  Future<Either<Failure, bool>> register(
      {required AuthEntity entity, required bool term}) {
    return authRepository.register(entity: entity, term: term);
  }
}
