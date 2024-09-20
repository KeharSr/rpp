import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';

// provider
final authApiModelProvider = Provider((ref) => const AuthApiModel.empty());

class AuthApiModel extends Equatable {
  final int? id;
  final String email;
  final String? password;
  final String firstName;
  final String lastName;
  final String? term;
  final String? avatarUrl;
  final String? displayName;
  final int? needUpdatePw;
  final String? phone;
  final String? address;
  final String? birthday;
  final String? city;
  final String? state;
  final String? country;
  final String? zipCode;

  const AuthApiModel({
    this.id,
    required this.email,
    this.password,
    required this.firstName,
    required this.lastName,
    this.term,
    this.avatarUrl,
    this.displayName,
    this.needUpdatePw,
    this.phone,
    this.address,
    this.birthday,
    this.city,
    this.state,
    this.country,
    this.zipCode,
  });

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
        needUpdatePw = 0,
        address = '',
        birthday = '',
        city = '',
        state = '',
        country = '',
        zipCode = '';



  // from entity
   AuthApiModel fromEntity(AuthEntity entity) {
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
      phone: entity.phone,
      address: entity.address,
      birthday: entity.birthday,
      city: entity.city,
      state: entity.state,
      country: entity.country,
      zipCode: entity.zipCode,
    );
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
      needUpdatePw: needUpdatePw ?? 0, // Provide a default if null
      phone: phone,
      address: address,
      birthday: birthday,
      city: city,
      state: state,
      country: country,
      zipCode: zipCode,
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
      needUpdatePw: json['need_update_pw'] ?? 0, // Provide a default if null
      phone: json['phone'],
      address: json['address'],
      birthday: json['birthday'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zip_code'],
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
      'address': address,
      'birthday': birthday,
      'city': city,
      'state': state,
      'country': country,
      'zip_code': zipCode
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
        phone,
        address,
        birthday,
        city,
        state,
        country,
        zipCode
      ];
}
