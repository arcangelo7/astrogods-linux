import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'auth_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class RegisterRequest {
  final String email;
  final String password;
  @JsonKey(name: 'preferred_language')
  final String preferredLanguage;
  @JsonKey(name: 'given_name')
  final String? givenName;
  @JsonKey(name: 'family_name')
  final String? familyName;
  @JsonKey(name: 'birth_datetime')
  final String? birthDatetime;
  @JsonKey(name: 'birth_latitude')
  final double? birthLatitude;
  @JsonKey(name: 'birth_longitude')
  final double? birthLongitude;
  @JsonKey(name: 'birth_place')
  final String? birthPlace;
  @JsonKey(name: 'unknown_time')
  final bool? unknownTime;

  const RegisterRequest({
    required this.email,
    required this.password,
    required this.preferredLanguage,
    this.givenName,
    this.familyName,
    this.birthDatetime,
    this.birthLatitude,
    this.birthLongitude,
    this.birthPlace,
    this.unknownTime,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class AuthResponse {
  @JsonKey(defaultValue: false)
  final bool success;
  final String? message;
  final User? user;
  final String? token;

  const AuthResponse({
    required this.success,
    this.message,
    this.user,
    this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
