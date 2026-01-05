// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synastry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Synastry _$SynastryFromJson(Map<String, dynamic> json) => Synastry(
  id: (json['id'] as num).toInt(),
  birthChartAId: (json['birth_chart_a_id'] as num).toInt(),
  birthChartBId: (json['birth_chart_b_id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  createdOn: DateTime.parse(json['created_on'] as String),
  birthChartA: json['birth_chart_a'] == null
      ? null
      : BirthChart.fromJson(json['birth_chart_a'] as Map<String, dynamic>),
  birthChartB: json['birth_chart_b'] == null
      ? null
      : BirthChart.fromJson(json['birth_chart_b'] as Map<String, dynamic>),
  hasReading: json['has_reading'] as bool?,
  readingId: (json['reading_id'] as num?)?.toInt(),
  readingVersion: json['reading_version'] as String?,
  readingOutdated: json['reading_outdated'] as bool?,
  currentVersion: json['current_version'] as String?,
);

Map<String, dynamic> _$SynastryToJson(Synastry instance) => <String, dynamic>{
  'id': instance.id,
  'birth_chart_a_id': instance.birthChartAId,
  'birth_chart_b_id': instance.birthChartBId,
  'birth_chart_a': instance.birthChartA,
  'birth_chart_b': instance.birthChartB,
  'created_on': instance.createdOn.toIso8601String(),
  'has_reading': instance.hasReading,
  'reading_id': instance.readingId,
  'reading_version': instance.readingVersion,
  'reading_outdated': instance.readingOutdated,
  'current_version': instance.currentVersion,
  'user_id': instance.userId,
};
