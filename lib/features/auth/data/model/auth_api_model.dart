import 'package:equatable/equatable.dart';

class AuthApiModel extends Equatable {
  final int? id;
  final String email;
  final String? password;
  final String firstName;
  final String lastName;
  final String? term;
  final String? avatarUrl;
  final String? displayName;
  final String? needUpdatePw;

  const AuthApiModel(
      {required this.id,
      required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.term,
      required this.avatarUrl,
      required this.displayName,
      required this.needUpdatePw});


  @override
  List<Object?> get props => [
        id,
        email,
        password,
        firstName,
        lastName,
        term,
        avatarUrl,
        displayName,
        needUpdatePw,
      ];
}
