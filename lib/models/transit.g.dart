// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransitLocation _$TransitLocationFromJson(Map<String, dynamic> json) =>
    TransitLocation(
      place: json['place'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$TransitLocationToJson(TransitLocation instance) =>
    <String, dynamic>{
      'place': instance.place,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
    };

DailyTransitReading _$DailyTransitReadingFromJson(Map<String, dynamic> json) =>
    DailyTransitReading(
      readingId: (json['reading_id'] as num).toInt(),
      reading: json['reading'] as String,
      date: DateTime.parse(json['date'] as String),
      location: TransitLocation.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      version: json['version'] as String?,
      createdOn: json['created_on'] == null
          ? null
          : DateTime.parse(json['created_on'] as String),
      cached: json['cached'] as bool?,
    );

Map<String, dynamic> _$DailyTransitReadingToJson(
  DailyTransitReading instance,
) => <String, dynamic>{
  'reading_id': instance.readingId,
  'reading': instance.reading,
  'date': instance.date.toIso8601String(),
  'location': instance.location,
  'version': instance.version,
  'created_on': instance.createdOn?.toIso8601String(),
  'cached': instance.cached,
};

MonthlyTransitReading _$MonthlyTransitReadingFromJson(
  Map<String, dynamic> json,
) => MonthlyTransitReading(
  readingId: (json['reading_id'] as num).toInt(),
  reading: json['reading'] as String,
  year: (json['year'] as num).toInt(),
  month: (json['month'] as num).toInt(),
  location: TransitLocation.fromJson(json['location'] as Map<String, dynamic>),
  version: json['version'] as String?,
  createdOn: json['created_on'] == null
      ? null
      : DateTime.parse(json['created_on'] as String),
  cached: json['cached'] as bool?,
);

Map<String, dynamic> _$MonthlyTransitReadingToJson(
  MonthlyTransitReading instance,
) => <String, dynamic>{
  'reading_id': instance.readingId,
  'reading': instance.reading,
  'year': instance.year,
  'month': instance.month,
  'location': instance.location,
  'version': instance.version,
  'created_on': instance.createdOn?.toIso8601String(),
  'cached': instance.cached,
};

TransitRequest _$TransitRequestFromJson(Map<String, dynamic> json) =>
    TransitRequest(
      birthChartId: (json['birth_chart_id'] as num).toInt(),
      date: json['date'] as String?,
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      location: json['location'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$TransitRequestToJson(TransitRequest instance) =>
    <String, dynamic>{
      'birth_chart_id': instance.birthChartId,
      'date': instance.date,
      'year': instance.year,
      'month': instance.month,
      'location': instance.location,
    };
