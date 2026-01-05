// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      preferredLanguage: json['preferred_language'] as String,
      givenName: json['given_name'] as String?,
      familyName: json['family_name'] as String?,
      birthDatetime: json['birth_datetime'] as String?,
      birthLatitude: (json['birth_latitude'] as num?)?.toDouble(),
      birthLongitude: (json['birth_longitude'] as num?)?.toDouble(),
      birthPlace: json['birth_place'] as String?,
      unknownTime: json['unknown_time'] as bool?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'preferred_language': instance.preferredLanguage,
      'given_name': instance.givenName,
      'family_name': instance.familyName,
      'birth_datetime': instance.birthDatetime,
      'birth_latitude': instance.birthLatitude,
      'birth_longitude': instance.birthLongitude,
      'birth_place': instance.birthPlace,
      'unknown_time': instance.unknownTime,
    };

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String?,
);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };
