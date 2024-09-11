import 'package:equatable/equatable.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';

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
  final String? phone;

  const AuthApiModel(
      {required this.id,
      required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.term,
      required this.avatarUrl,
      required this.displayName,
      required this.needUpdatePw,
      required this.phone});

  // empty model
  const AuthApiModel.empty()
      : id = 0,
        email = '',
        password = '',
        firstName = '',
        lastName = '',
        term = '',
        avatarUrl = '',
        displayName = '',
        phone = '',
        needUpdatePw = '';

  // from entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
        id: entity.id,
        email: entity.email,
        password: entity.password,
        firstName: entity.firstName,
        lastName: entity.lastName,
        term: entity.term,
        avatarUrl: entity.avatarUrl,
        displayName: entity.displayName,
        needUpdatePw: entity.needUpdatePw,
        phone: entity.phone);
  }

  // to entity
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      term: term,
      avatarUrl: avatarUrl,
      displayName: displayName,
      needUpdatePw: needUpdatePw,
      phone: phone,
    );
  }

  // from json
  factory AuthApiModel.fromJson(Map<String, dynamic> json) {
    return AuthApiModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      term: json['term'],
      avatarUrl: json['avatar_url'],
      displayName: json['display_name'],
      needUpdatePw: json['need_update_pw'],
      phone: json['phone'],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'term': term,
      'avatar_url': avatarUrl,
      'display_name': displayName,
      'need_update_pw': needUpdatePw,
      'phone': phone,
    };
  }

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
