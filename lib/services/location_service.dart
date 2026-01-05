import 'dart:async';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../models/location.dart';

class LocationService {
  final ApiClient _apiClient;

  LocationService({BuildContext? context})
    : _apiClient = ApiClient(context: context);
  Timer? _debounceTimer;

  Future<List<PlaceSearchResult>> searchPlaces(
    String query, {
    String language = 'it',
  }) async {
    try {
      if (query.trim().isEmpty || query.length < 2) {
        return [];
      }

      final encodedQuery = Uri.encodeComponent(query.trim());
      final encodedLanguage = Uri.encodeComponent(language);

      final response = await _apiClient.get(
        '/location/search?query=$encodedQuery&language=$encodedLanguage',
      );

      if (response['status'] == 'success' && response['data'] != null) {
        final List<dynamic> dataList = response['data'];
        return dataList
            .map((item) => PlaceSearchResult.fromJson(item))
            .toList();
      }

      throw const LocationServiceException('Invalid response format');
    } catch (e) {
      throw LocationServiceException(
        'Failed to search places: ${e.toString()}',
      );
    }
  }

  Future<List<PlaceSearchResult>> searchPlacesDebounced(
    String query, {
    String language = 'it',
    Duration debounceDelay = const Duration(milliseconds: 500),
  }) async {
    final completer = Completer<List<PlaceSearchResult>>();

    _debounceTimer?.cancel();
    _debounceTimer = Timer(debounceDelay, () async {
      try {
        final results = await searchPlaces(query, language: language);
        if (!completer.isCompleted) {
          completer.complete(results);
        }
      } catch (e) {
        if (!completer.isCompleted) {
          completer.completeError(e);
        }
      }
    });

    return completer.future;
  }

  void cancelPendingRequests() {
    _debounceTimer?.cancel();
  }

  void dispose() {
    _debounceTimer?.cancel();
    _apiClient.dispose();
  }
}

class LocationServiceException implements Exception {
  final String message;

  const LocationServiceException(this.message);

  @override
  String toString() => 'LocationServiceException: $message';
}
