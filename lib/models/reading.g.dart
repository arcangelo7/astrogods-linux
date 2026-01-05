// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reading _$ReadingFromJson(Map<String, dynamic> json) => Reading(
  id: (json['id'] as num).toInt(),
  reading: json['reading'] as String,
  birthChartId: (json['birth_chart_id'] as num).toInt(),
  version: json['version'] as String?,
  createdOn: json['created_on'] == null
      ? null
      : DateTime.parse(json['created_on'] as String),
  birthChartHash: json['birth_chart_hash'] as String?,
);

Map<String, dynamic> _$ReadingToJson(Reading instance) => <String, dynamic>{
  'id': instance.id,
  'reading': instance.reading,
  'birth_chart_id': instance.birthChartId,
  'version': instance.version,
  'created_on': instance.createdOn?.toIso8601String(),
  'birth_chart_hash': instance.birthChartHash,
};
