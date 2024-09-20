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
  final int? needUpdatePw;
  final String? address;
  final String? birthday;
  final String? city;
  final String? state;
  final String? country;
  final String? zipCode;

  const AuthEntity({
    this.id,
    required this.email,
    this.password,
    required this.firstName,
    required this.lastName,
    this.term,
    this.avatarUrl,
    this.displayName,
    required this.phone,
    this.address,
    this.needUpdatePw,
    this.birthday,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    // Default value
  });

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
        address,
        birthday,
        city,
        state,
        country,
        zipCode,
      ];
}
