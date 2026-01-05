// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birth_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BirthChart _$BirthChartFromJson(Map<String, dynamic> json) => BirthChart(
  id: (json['id'] as num).toInt(),
  givenName: json['given_name'] as String,
  familyName: json['family_name'] as String,
  date: DateTime.parse(json['date'] as String),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  place: json['place'] as String?,
  unknownTime: json['unknown_time'] as bool? ?? false,
  isPersonal: json['is_personal'] as bool?,
  createdOn: json['created_on'] == null
      ? null
      : DateTime.parse(json['created_on'] as String),
  hasReading: json['has_reading'] as bool?,
  readingId: (json['reading_id'] as num?)?.toInt(),
  readingVersion: json['reading_version'] as String?,
  readingOutdated: json['reading_outdated'] as bool?,
  currentVersion: json['current_version'] as String?,
);

Map<String, dynamic> _$BirthChartToJson(BirthChart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'given_name': instance.givenName,
      'family_name': instance.familyName,
      'date': instance.date.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'place': instance.place,
      'unknown_time': instance.unknownTime,
      'is_personal': instance.isPersonal,
      'created_on': instance.createdOn?.toIso8601String(),
      'has_reading': instance.hasReading,
      'reading_id': instance.readingId,
      'reading_version': instance.readingVersion,
      'reading_outdated': instance.readingOutdated,
      'current_version': instance.currentVersion,
    };
