// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planetary_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanetaryPosition _$PlanetaryPositionFromJson(Map<String, dynamic> json) =>
    PlanetaryPosition(
      id: (json['id'] as num).toInt(),
      planet: json['planet'] as String,
      sign: json['sign'] as String,
      position: (json['position'] as num).toDouble(),
      absPos: (json['abs_pos'] as num).toDouble(),
      house: (json['house'] as num).toInt(),
      retrograde: json['retrograde'] as bool?,
      birthChartId: (json['birth_chart_id'] as num).toInt(),
    );

Map<String, dynamic> _$PlanetaryPositionToJson(PlanetaryPosition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planet': instance.planet,
      'sign': instance.sign,
      'position': instance.position,
      'abs_pos': instance.absPos,
      'house': instance.house,
      'retrograde': instance.retrograde,
      'birth_chart_id': instance.birthChartId,
    };

PlanetaryAspect _$PlanetaryAspectFromJson(Map<String, dynamic> json) =>
    PlanetaryAspect(
      id: (json['id'] as num).toInt(),
      p1Name: json['p1_name'] as String,
      p1AbsPos: (json['p1_abs_pos'] as num).toDouble(),
      p1House: (json['p1_house'] as num?)?.toInt(),
      p2Name: json['p2_name'] as String,
      p2AbsPos: (json['p2_abs_pos'] as num).toDouble(),
      p2House: (json['p2_house'] as num?)?.toInt(),
      aspect: json['aspect'] as String,
      orbit: (json['orbit'] as num).toDouble(),
      aspectDegrees: (json['aspect_degrees'] as num).toInt(),
      birthChartId: (json['birth_chart_id'] as num).toInt(),
    );

Map<String, dynamic> _$PlanetaryAspectToJson(PlanetaryAspect instance) =>
    <String, dynamic>{
      'id': instance.id,
      'p1_name': instance.p1Name,
      'p1_abs_pos': instance.p1AbsPos,
      'p1_house': instance.p1House,
      'p2_name': instance.p2Name,
      'p2_abs_pos': instance.p2AbsPos,
      'p2_house': instance.p2House,
      'aspect': instance.aspect,
      'orbit': instance.orbit,
      'aspect_degrees': instance.aspectDegrees,
      'birth_chart_id': instance.birthChartId,
    };

BirthChartData _$BirthChartDataFromJson(Map<String, dynamic> json) =>
    BirthChartData(
      birthChart: json['birth_chart'] as Map<String, dynamic>,
      planetaryPositions: (json['planetary_positions'] as List<dynamic>)
          .map((e) => PlanetaryPosition.fromJson(e as Map<String, dynamic>))
          .toList(),
      planetaryAspects: (json['planetary_aspects'] as List<dynamic>)
          .map((e) => PlanetaryAspect.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BirthChartDataToJson(BirthChartData instance) =>
    <String, dynamic>{
      'birth_chart': instance.birthChart,
      'planetary_positions': instance.planetaryPositions,
      'planetary_aspects': instance.planetaryAspects,
    };
