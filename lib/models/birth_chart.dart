import 'package:json_annotation/json_annotation.dart';

part 'birth_chart.g.dart';

@JsonSerializable()
class BirthChart {
  final int id;
  @JsonKey(name: 'given_name')
  final String givenName;
  @JsonKey(name: 'family_name')
  final String familyName;
  final DateTime date;
  final double latitude;
  final double longitude;
  final String? place;
  @JsonKey(name: 'unknown_time')
  final bool unknownTime;
  @JsonKey(name: 'is_personal')
  final bool? isPersonal;
  @JsonKey(name: 'created_on')
  final DateTime? createdOn;
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

  const BirthChart({
    required this.id,
    required this.givenName,
    required this.familyName,
    required this.date,
    required this.latitude,
    required this.longitude,
    this.place,
    this.unknownTime = false,
    this.isPersonal,
    this.createdOn,
    this.hasReading,
    this.readingId,
    this.readingVersion,
    this.readingOutdated,
    this.currentVersion,
  });

  factory BirthChart.fromJson(Map<String, dynamic> json) =>
      _$BirthChartFromJson(json);
  Map<String, dynamic> toJson() => _$BirthChartToJson(this);

  BirthChart copyWith({
    int? id,
    String? givenName,
    String? familyName,
    DateTime? date,
    double? latitude,
    double? longitude,
    String? place,
    bool? unknownTime,
    bool? isPersonal,
    DateTime? createdOn,
    bool? hasReading,
    int? readingId,
    String? readingVersion,
    bool? readingOutdated,
    String? currentVersion,
  }) {
    return BirthChart(
      id: id ?? this.id,
      givenName: givenName ?? this.givenName,
      familyName: familyName ?? this.familyName,
      date: date ?? this.date,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      place: place ?? this.place,
      unknownTime: unknownTime ?? this.unknownTime,
      isPersonal: isPersonal ?? this.isPersonal,
      createdOn: createdOn ?? this.createdOn,
      hasReading: hasReading ?? this.hasReading,
      readingId: readingId ?? this.readingId,
      readingVersion: readingVersion ?? this.readingVersion,
      readingOutdated: readingOutdated ?? this.readingOutdated,
      currentVersion: currentVersion ?? this.currentVersion,
    );
  }

  String get fullName => '$givenName $familyName';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BirthChart) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
