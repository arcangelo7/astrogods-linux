// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSearchResult _$PlaceSearchResultFromJson(Map<String, dynamic> json) =>
    PlaceSearchResult(
      placeId: json['place_id'] as String,
      description: json['description'] as String,
      mainText: json['main_text'] as String,
      secondaryText: json['secondary_text'] as String,
    );

Map<String, dynamic> _$PlaceSearchResultToJson(PlaceSearchResult instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'description': instance.description,
      'main_text': instance.mainText,
      'secondary_text': instance.secondaryText,
    };

PlaceDetails _$PlaceDetailsFromJson(Map<String, dynamic> json) => PlaceDetails(
  placeId: json['place_id'] as String,
  name: json['name'] as String,
  formattedAddress: json['formatted_address'] as String,
);

Map<String, dynamic> _$PlaceDetailsToJson(PlaceDetails instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'name': instance.name,
      'formatted_address': instance.formattedAddress,
    };

LocationSearchResponse _$LocationSearchResponseFromJson(
  Map<String, dynamic> json,
) => LocationSearchResponse(
  status: json['status'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => PlaceSearchResult.fromJson(e as Map<String, dynamic>))
      .toList(),
  query: json['query'] as String,
  language: json['language'] as String,
);

Map<String, dynamic> _$LocationSearchResponseToJson(
  LocationSearchResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'data': instance.data,
  'query': instance.query,
  'language': instance.language,
};

LocationDetailsResponse _$LocationDetailsResponseFromJson(
  Map<String, dynamic> json,
) => LocationDetailsResponse(
  status: json['status'] as String,
  data: PlaceDetails.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LocationDetailsResponseToJson(
  LocationDetailsResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
