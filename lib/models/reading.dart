import 'package:json_annotation/json_annotation.dart';

part 'reading.g.dart';

@JsonSerializable()
class Reading {
  final int id;
  final String reading;
  @JsonKey(name: 'birth_chart_id')
  final int birthChartId;
  final String? version;
  @JsonKey(name: 'created_on')
  final DateTime? createdOn;
  @JsonKey(name: 'birth_chart_hash')
  final String? birthChartHash;

  const Reading({
    required this.id,
    required this.reading,
    required this.birthChartId,
    this.version,
    this.createdOn,
    this.birthChartHash,
  });

  factory Reading.fromJson(Map<String, dynamic> json) =>
      _$ReadingFromJson(json);
  Map<String, dynamic> toJson() => _$ReadingToJson(this);
}
