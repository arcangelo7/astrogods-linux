import 'package:json_annotation/json_annotation.dart';

part 'planetary_data.g.dart';

@JsonSerializable()
class PlanetaryPosition {
  final int id;
  final String planet;
  final String sign;
  final double position;
  @JsonKey(name: 'abs_pos')
  final double absPos;
  final int house;
  final bool? retrograde;
  @JsonKey(name: 'birth_chart_id')
  final int birthChartId;

  const PlanetaryPosition({
    required this.id,
    required this.planet,
    required this.sign,
    required this.position,
    required this.absPos,
    required this.house,
    this.retrograde,
    required this.birthChartId,
  });

  factory PlanetaryPosition.fromJson(Map<String, dynamic> json) =>
      _$PlanetaryPositionFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetaryPositionToJson(this);

  @override
  String toString() {
    return 'PlanetaryPosition(planet: $planet, sign: $sign, position: $position°, house: $house, retrograde: $retrograde)';
  }
}

@JsonSerializable()
class PlanetaryAspect {
  final int id;
  @JsonKey(name: 'p1_name')
  final String p1Name;
  @JsonKey(name: 'p1_abs_pos')
  final double p1AbsPos;
  @JsonKey(name: 'p1_house')
  final int? p1House;
  @JsonKey(name: 'p2_name')
  final String p2Name;
  @JsonKey(name: 'p2_abs_pos')
  final double p2AbsPos;
  @JsonKey(name: 'p2_house')
  final int? p2House;
  final String aspect;
  final double orbit;
  @JsonKey(name: 'aspect_degrees')
  final int aspectDegrees;
  @JsonKey(name: 'birth_chart_id')
  final int birthChartId;

  const PlanetaryAspect({
    required this.id,
    required this.p1Name,
    required this.p1AbsPos,
    this.p1House,
    required this.p2Name,
    required this.p2AbsPos,
    this.p2House,
    required this.aspect,
    required this.orbit,
    required this.aspectDegrees,
    required this.birthChartId,
  });

  factory PlanetaryAspect.fromJson(Map<String, dynamic> json) =>
      _$PlanetaryAspectFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetaryAspectToJson(this);

  @override
  String toString() {
    return 'PlanetaryAspect($p1Name $aspect $p2Name, orbit: ${orbit.toStringAsFixed(2)}°)';
  }
}

@JsonSerializable()
class BirthChartData {
  @JsonKey(name: 'birth_chart')
  final Map<String, dynamic> birthChart;
  @JsonKey(name: 'planetary_positions')
  final List<PlanetaryPosition> planetaryPositions;
  @JsonKey(name: 'planetary_aspects')
  final List<PlanetaryAspect> planetaryAspects;

  const BirthChartData({
    required this.birthChart,
    required this.planetaryPositions,
    required this.planetaryAspects,
  });

  factory BirthChartData.fromJson(Map<String, dynamic> json) =>
      _$BirthChartDataFromJson(json);

  Map<String, dynamic> toJson() => _$BirthChartDataToJson(this);

  /// Get planetary positions by planet name
  List<PlanetaryPosition> getPositionsForPlanet(String planetName) {
    return planetaryPositions
        .where((pos) => pos.planet.toLowerCase() == planetName.toLowerCase())
        .toList();
  }

  /// Get aspects involving a specific planet
  List<PlanetaryAspect> getAspectsForPlanet(String planetName) {
    return planetaryAspects
        .where(
          (aspect) =>
              aspect.p1Name.toLowerCase() == planetName.toLowerCase() ||
              aspect.p2Name.toLowerCase() == planetName.toLowerCase(),
        )
        .toList();
  }

  /// Get all planets in a specific house
  List<PlanetaryPosition> getPlanetsInHouse(int houseNumber) {
    return planetaryPositions.where((pos) => pos.house == houseNumber).toList();
  }

  /// Get all planets in a specific sign
  List<PlanetaryPosition> getPlanetsInSign(String signName) {
    return planetaryPositions
        .where((pos) => pos.sign.toLowerCase() == signName.toLowerCase())
        .toList();
  }
}
