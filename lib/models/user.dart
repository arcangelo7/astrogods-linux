import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String email;
  @JsonKey(name: 'preferred_language')
  final String preferredLanguage;
  @JsonKey(name: 'given_name')
  final String? givenName;
  @JsonKey(name: 'family_name')
  final String? familyName;
  @JsonKey(name: 'birth_datetime')
  final DateTime? birthDatetime;
  @JsonKey(name: 'birth_latitude')
  final double? birthLatitude;
  @JsonKey(name: 'birth_longitude')
  final double? birthLongitude;
  @JsonKey(name: 'birth_place')
  final String? birthPlace;
  @JsonKey(name: 'unknown_time')
  final bool? unknownTime;
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  @JsonKey(name: 'night_mode')
  final bool nightMode;
  @JsonKey(name: 'has_birth_data')
  final bool? hasBirthData;
  @JsonKey(name: 'created_on')
  final DateTime createdOn;

  const User({
    required this.id,
    required this.email,
    required this.preferredLanguage,
    this.givenName,
    this.familyName,
    this.birthDatetime,
    this.birthLatitude,
    this.birthLongitude,
    this.birthPlace,
    this.unknownTime,
    this.profilePicture,
    this.nightMode = true,
    this.hasBirthData,
    required this.createdOn,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? email,
    String? preferredLanguage,
    String? givenName,
    String? familyName,
    DateTime? birthDatetime,
    double? birthLatitude,
    double? birthLongitude,
    String? birthPlace,
    bool? unknownTime,
    String? profilePicture,
    bool? nightMode,
    bool? hasBirthData,
    DateTime? createdOn,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      givenName: givenName ?? this.givenName,
      familyName: familyName ?? this.familyName,
      birthDatetime: birthDatetime ?? this.birthDatetime,
      birthLatitude: birthLatitude ?? this.birthLatitude,
      birthLongitude: birthLongitude ?? this.birthLongitude,
      birthPlace: birthPlace ?? this.birthPlace,
      unknownTime: unknownTime ?? this.unknownTime,
      profilePicture: profilePicture ?? this.profilePicture,
      nightMode: nightMode ?? this.nightMode,
      hasBirthData: hasBirthData ?? this.hasBirthData,
      createdOn: createdOn ?? this.createdOn,
    );
  }

  String get fullName {
    if (givenName != null && familyName != null) {
      return '$givenName $familyName';
    }
    return email;
  }
}
