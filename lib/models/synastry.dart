import 'package:json_annotation/json_annotation.dart';
import 'birth_chart.dart';

part 'synastry.g.dart';

@JsonSerializable()
class Synastry {
  final int id;
  @JsonKey(name: 'birth_chart_a_id')
  final int birthChartAId;
  @JsonKey(name: 'birth_chart_b_id')
  final int birthChartBId;
  @JsonKey(name: 'birth_chart_a')
  final BirthChart? birthChartA;
  @JsonKey(name: 'birth_chart_b')
  final BirthChart? birthChartB;
  @JsonKey(name: 'created_on')
  final DateTime createdOn;
  @JsonKey(name: 'has_reading')
  final bool? hasReading;
  @JsonKey(name: 'reading_id')
  final int? readingId;
  @JsonKey(name: 'reading_version')
  final String? readingVersion;
  @JsonKey(name: 'reading_outdated')
  final bool? readingOutdated;
  @JsonKey(name: 'current_version')
  final String? currentVersion;
  @JsonKey(name: 'user_id')
  final int userId;

  const Synastry({
    required this.id,
    required this.birthChartAId,
    required this.birthChartBId,
    required this.userId,
    required this.createdOn,
    this.birthChartA,
    this.birthChartB,
    this.hasReading,
    this.readingId,
    this.readingVersion,
    this.readingOutdated,
    this.currentVersion,
  });

  factory Synastry.fromJson(Map<String, dynamic> json) {
    // Handle the case where birth_chart_a/b might already be BirthChart objects
    final processedJson = Map<String, dynamic>.from(json);

    if (json['birth_chart_a'] != null && json['birth_chart_a'] is! Map) {
      processedJson['birth_chart_a'] = (json['birth_chart_a'] as BirthChart).toJson();
    }

    if (json['birth_chart_b'] != null && json['birth_chart_b'] is! Map) {
      processedJson['birth_chart_b'] = (json['birth_chart_b'] as BirthChart).toJson();
    }

    return _$SynastryFromJson(processedJson);
  }
  Map<String, dynamic> toJson() => _$SynastryToJson(this);

  Synastry copyWith({
    int? id,
    int? birthChartAId,
    int? birthChartBId,
    int? userId,
    BirthChart? birthChartA,
    BirthChart? birthChartB,
    DateTime? createdOn,
    bool? hasReading,
    int? readingId,
    String? readingVersion,
    bool? readingOutdated,
    String? currentVersion,
  }) {
    return Synastry(
      id: id ?? this.id,
      birthChartAId: birthChartAId ?? this.birthChartAId,
      birthChartBId: birthChartBId ?? this.birthChartBId,
      userId: userId ?? this.userId,
      birthChartA: birthChartA ?? this.birthChartA,
      birthChartB: birthChartB ?? this.birthChartB,
      createdOn: createdOn ?? this.createdOn,
      hasReading: hasReading ?? this.hasReading,
      readingId: readingId ?? this.readingId,
      readingVersion: readingVersion ?? this.readingVersion,
      readingOutdated: readingOutdated ?? this.readingOutdated,
      currentVersion: currentVersion ?? this.currentVersion,
    );
  }

  String get relationshipTitle {
    return '${birthChartA!.fullName} e ${birthChartB!.fullName}';
  }

  String get shortRelationshipTitle {
    return '${birthChartA!.givenName} & ${birthChartB!.givenName}';
  }
}