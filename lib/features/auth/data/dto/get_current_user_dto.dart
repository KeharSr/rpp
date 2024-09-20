
import 'package:json_annotation/json_annotation.dart';
import 'package:rpp/features/auth/data/model/auth_api_model.dart';

part 'get_current_user_dto.g.dart';

@JsonSerializable()
class GetCurrentUserDto {
  
  final AuthApiModel data;

  GetCurrentUserDto({
   
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetCurrentUserDtoToJson(this);

  factory GetCurrentUserDto.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserDtoFromJson(json);
}
