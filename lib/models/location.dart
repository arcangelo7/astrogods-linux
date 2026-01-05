import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class PlaceSearchResult {
  @JsonKey(name: 'place_id')
  final String placeId;
  final String description;
  @JsonKey(name: 'main_text')
  final String mainText;
  @JsonKey(name: 'secondary_text')
  final String secondaryText;

  PlaceSearchResult({
    required this.placeId,
    required this.description,
    required this.mainText,
    required this.secondaryText,
  });

  factory PlaceSearchResult.fromJson(Map<String, dynamic> json) =>
      _$PlaceSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceSearchResultToJson(this);

  @override
  String toString() => description;
}

@JsonSerializable()
class PlaceDetails {
  @JsonKey(name: 'place_id')
  final String placeId;
  final String name;
  @JsonKey(name: 'formatted_address')
  final String formattedAddress;

  PlaceDetails({
    required this.placeId,
    required this.name,
    required this.formattedAddress,
  });

  factory PlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsToJson(this);

  @override
  String toString() => formattedAddress;
}

@JsonSerializable()
class LocationSearchResponse {
  final String status;
  final List<PlaceSearchResult> data;
  final String query;
  final String language;

  LocationSearchResponse({
    required this.status,
    required this.data,
    required this.query,
    required this.language,
  });

  factory LocationSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationSearchResponseToJson(this);
}

@JsonSerializable()
class LocationDetailsResponse {
  final String status;
  final PlaceDetails data;

  LocationDetailsResponse({required this.status, required this.data});

  factory LocationDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDetailsResponseToJson(this);
}
