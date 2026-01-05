// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  preferredLanguage: json['preferred_language'] as String,
  givenName: json['given_name'] as String?,
  familyName: json['family_name'] as String?,
  birthDatetime: json['birth_datetime'] == null
      ? null
      : DateTime.parse(json['birth_datetime'] as String),
  birthLatitude: (json['birth_latitude'] as num?)?.toDouble(),
  birthLongitude: (json['birth_longitude'] as num?)?.toDouble(),
  birthPlace: json['birth_place'] as String?,
  unknownTime: json['unknown_time'] as bool?,
  profilePicture: json['profile_picture'] as String?,
  nightMode: json['night_mode'] as bool? ?? true,
  hasBirthData: json['has_birth_data'] as bool?,
  createdOn: DateTime.parse(json['created_on'] as String),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'preferred_language': instance.preferredLanguage,
  'given_name': instance.givenName,
  'family_name': instance.familyName,
  'birth_datetime': instance.birthDatetime?.toIso8601String(),
  'birth_latitude': instance.birthLatitude,
  'birth_longitude': instance.birthLongitude,
  'birth_place': instance.birthPlace,
  'unknown_time': instance.unknownTime,
  'profile_picture': instance.profilePicture,
  'night_mode': instance.nightMode,
  'has_birth_data': instance.hasBirthData,
  'created_on': instance.createdOn.toIso8601String(),
};
