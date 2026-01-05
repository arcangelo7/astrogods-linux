import 'package:json_annotation/json_annotation.dart';

part 'transit.g.dart';

@JsonSerializable()
class TransitLocation {
  final String place;
  final double latitude;
  final double longitude;
  final String timezone;

  const TransitLocation({
    required this.place,
    required this.latitude,
    required this.longitude,
    required this.timezone,
  });

  factory TransitLocation.fromJson(Map<String, dynamic> json) =>
      _$TransitLocationFromJson(json);
  Map<String, dynamic> toJson() => _$TransitLocationToJson(this);
}

@JsonSerializable()
class DailyTransitReading {
  @JsonKey(name: 'reading_id')
  final int readingId;
  final String reading;
  final DateTime date;
  final TransitLocation location;
  final String? version;
  @JsonKey(name: 'created_on')
  final DateTime? createdOn;
  final bool? cached;

  const DailyTransitReading({
    required this.readingId,
    required this.reading,
    required this.date,
    required this.location,
    this.version,
    this.createdOn,
    this.cached,
  });

  factory DailyTransitReading.fromJson(Map<String, dynamic> json) =>
      _$DailyTransitReadingFromJson(json);
  Map<String, dynamic> toJson() => _$DailyTransitReadingToJson(this);
}

@JsonSerializable()
class MonthlyTransitReading {
  @JsonKey(name: 'reading_id')
  final int readingId;
  final String reading;
  final int year;
  final int month;
  final TransitLocation location;
  final String? version;
  @JsonKey(name: 'created_on')
  final DateTime? createdOn;
  final bool? cached;

  const MonthlyTransitReading({
    required this.readingId,
    required this.reading,
    required this.year,
    required this.month,
    required this.location,
    this.version,
    this.createdOn,
    this.cached,
  });

  factory MonthlyTransitReading.fromJson(Map<String, dynamic> json) =>
      _$MonthlyTransitReadingFromJson(json);
  Map<String, dynamic> toJson() => _$MonthlyTransitReadingToJson(this);
}

@JsonSerializable()
class TransitRequest {
  @JsonKey(name: 'birth_chart_id')
  final int birthChartId;
  final String? date;
  final int? year;
  final int? month;
  final Map<String, dynamic> location;

  const TransitRequest({
    required this.birthChartId,
    this.date,
    this.year,
    this.month,
    required this.location,
  });

  factory TransitRequest.fromJson(Map<String, dynamic> json) =>
      _$TransitRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TransitRequestToJson(this);
}