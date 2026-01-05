import 'package:flutter/material.dart';
import '../models/birth_chart.dart';
import '../models/reading.dart';
import '../models/reading_chunk.dart';
import 'api_client.dart';

class BirthChartService {
  final ApiClient _apiClient;

  BirthChartService({ApiClient? apiClient, BuildContext? context})
    : _apiClient = apiClient ?? ApiClient(context: context);

  Future<BirthChart> createBirthChart({
    required String givenName,
    required String familyName,
    required DateTime date,
    required String placeId,
    String? place,
    bool unknownTime = false,
  }) async {
    try {
      final response = await _apiClient.post(
        '/birth-chart',
        body: {
          'given_name': givenName,
          'family_name': familyName,
          'date': date.toIso8601String(),
          'place_id': placeId,
          'place': place,
          'unknown_time': unknownTime,
        },
      );

      return BirthChart.fromJson(response['birth_chart']);
    } catch (e) {
      if (e is ApiException) {
        if (e.statusCode == 403) {
          throw SubscriptionRequiredException(
            e.message,
            errorType: 'subscription_required',
          );
        }
          rethrow;
      }
      throw BirthChartException(
        'Failed to create birth chart: ${e.toString()}',
      );
    }
  }

  Future<BirthChart> getBirthChart(int id) async {
    try {
      final response = await _apiClient.get('/birth-chart/$id');
      return BirthChart.fromJson(response);
    } catch (e) {
      throw BirthChartException('Failed to get birth chart: ${e.toString()}');
    }
  }

  Future<Reading?> getReading(int birthChartId) async {
    try {
      final response = await _apiClient.get(
        '/birth-chart/$birthChartId/reading',
      );

      // Check if reading is outdated
      if (response['status'] == 'outdated') {
        return null; // Treat outdated reading as no reading
      }

      return Reading.fromJson(response['data']);
    } catch (e) {
      if (e is ApiException && e.statusCode == 404) {
        return null; // Reading not found
      }
      throw BirthChartException('Failed to get reading: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> calculateBirthChart(int birthChartId) async {
    try {
      final response = await _apiClient.post(
        '/birth-chart/$birthChartId/calculate',
      );
      return response['data'];
    } catch (e) {
      throw BirthChartException(
        'Failed to calculate birth chart: ${e.toString()}',
      );
    }
  }

  Future<Map<String, dynamic>> getBirthChartData(int birthChartId) async {
    try {
      final response = await _apiClient.get('/birth-chart/$birthChartId/data');
      return response['data'];
    } catch (e) {
      throw BirthChartException(
        'Failed to get birth chart data: ${e.toString()}',
      );
    }
  }

  Future<String> getBirthChartSvg(
    int birthChartId, {
    double zoom = 1.0,
  }) async {
    try {
      final svg = await _apiClient.getRawText(
        '/birth-chart/$birthChartId/svg?zoom=${zoom.toString()}',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return svg;
    } catch (e) {
      throw BirthChartException('Failed to get chart SVG: ${e.toString()}');
    }
  }

  Future<String> getBirthChartDetailsSvg(
    int birthChartId, {
    required double zoom,
    required bool darkMode,
  }) async {
    try {
      final svg = await _apiClient.getRawText(
        '/birth-chart/$birthChartId/svg-details?zoom=${zoom.toString()}&dark_mode=$darkMode',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return svg;
    } catch (e) {
      throw BirthChartException('Failed to get chart details SVG: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> getLunarPhase(int birthChartId) async {
    final response = await _apiClient.get('/birth-chart/$birthChartId/lunar-phase');
    return response;
  }

  Future<List<Reading>> getReadings(int birthChartId) async {
    try {
      final response = await _apiClient.get(
        '/birth-chart/$birthChartId/readings',
      );
      final List<dynamic> readingsJson = response['readings'];

      return readingsJson.map((json) => Reading.fromJson(json)).toList();
    } catch (e) {
      throw BirthChartException('Failed to get readings: ${e.toString()}');
    }
  }

  Stream<ReadingChunk> streamReading(int birthChartId) async* {
    try {
      yield* _apiClient.streamReadingChunks(
        '/birth-chart/$birthChartId/stream-reading',
      );
    } catch (e) {
      final apiException = e as ApiException;
      yield ReadingChunk(
        content: '',
        topic: 'Error',
        isComplete: true,
        error: apiException.message,
        errorKey: apiException.errorKey,
        isSubscriptionRequired: apiException.statusCode == 403,
      );
    }
  }

  Future<List<BirthChart>> getSavedCharts() async {
    try {
      final response = await _apiClient.get('/saved-charts');
      final List<dynamic> chartsJson = response['charts'];

      return chartsJson.map((json) => BirthChart.fromJson(json)).toList();
    } catch (e) {
      if (e is ApiException) rethrow;
      throw BirthChartException('Failed to get saved charts: ${e.toString()}');
    }
  }

  Future<BirthChart> updateBirthChart(
    int birthChartId,
    Map<String, dynamic> updateData,
  ) async {
    try {
      final response = await _apiClient.put(
        '/birth-chart/$birthChartId/edit',
        body: updateData,
      );
      return BirthChart.fromJson(response['birth_chart']);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw BirthChartException(
        'Failed to update birth chart: ${e.toString()}',
      );
    }
  }

  Future<void> deleteBirthChart(int birthChartId) async {
    try {
      await _apiClient.delete('/birth-chart/$birthChartId/delete');
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw BirthChartException(
        'Failed to delete birth chart: ${e.toString()}',
      );
    }
  }

  Future<BirthChart> setPersonalChart(
    int birthChartId, {
    bool isPersonal = true,
  }) async {
    try {
      final response = await _apiClient.post(
        '/birth-chart/$birthChartId/set-personal',
        body: {'is_personal': isPersonal},
      );
      return BirthChart.fromJson(response['chart']);
    } catch (e) {
      throw BirthChartException(
        'Failed to set personal chart: ${e.toString()}',
      );
    }
  }

  Future<Map<String, dynamic>> syncPersonalChart() async {
    try {
      final response = await _apiClient.post('/sync-personal-chart');
      return response;
    } catch (e) {
      if (e is ApiException) rethrow;
      throw BirthChartException(
        'Failed to sync personal chart: ${e.toString()}',
      );
    }
  }

  void dispose() {
    _apiClient.dispose();
  }
}

class BirthChartException implements Exception {
  final String message;

  const BirthChartException(this.message);

  @override
  String toString() => 'BirthChartException: $message';
}

class SubscriptionRequiredException extends BirthChartException {
  final String errorType;

  const SubscriptionRequiredException(super.message, {required this.errorType});

  @override
  String toString() => 'SubscriptionRequiredException: $message';
}
