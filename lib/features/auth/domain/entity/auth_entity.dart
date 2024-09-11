import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final int? id;
  final String email;
  final String? password;
  final String firstName;
  final String lastName;
  final String? phone;
  final String? term;
  final String? avatarUrl;
  final String? displayName;
  final String? needUpdatePw;

  const AuthEntity(
      {this.id,
      required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.term,
      this.avatarUrl,
      this.displayName,
      required this.phone,
      this.needUpdatePw});

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
        phone,
      ];
}
