import 'package:flutter/material.dart';
import '../models/reading.dart';
import '../models/reading_chunk.dart';
import '../models/synastry.dart';
import 'api_client.dart';

class SynastryService {
  final ApiClient _apiClient;

  SynastryService({ApiClient? apiClient, BuildContext? context})
    : _apiClient = apiClient ?? ApiClient(context: context);

  Future<List<Synastry>> getSavedSynastries() async {
    try {
      final response = await _apiClient.get('/synastry');
      final List<dynamic> synastriesList = response['synastries'] ?? [];
      return synastriesList.map((json) => Synastry.fromJson(json)).toList();
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw SynastryException(
        'Failed to get saved synastries: ${e.toString()}',
      );
    }
  }

  Future<Synastry> getSynastry(int synastryId) async {
    try {
      final response = await _apiClient.get('/synastry/$synastryId');
      return Synastry.fromJson(response['synastry']);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw SynastryException('Failed to get synastry: ${e.toString()}');
    }
  }

  Future<Synastry> createSynastry({
    required int birthChartAId,
    required int birthChartBId,
  }) async {
    try {
      final response = await _apiClient.post(
        '/synastry',
        body: {
          'birth_chart_a_id': birthChartAId,
          'birth_chart_b_id': birthChartBId,
        },
      );

      return Synastry.fromJson(response['synastry']);
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
      throw SynastryException('Failed to create synastry: ${e.toString()}');
    }
  }

  Future<Reading?> getSynastryReading(int synastryId) async {
    try {
      final response = await _apiClient.get('/synastry/$synastryId/reading');
      return Reading.fromJson(response['reading']);
    } catch (e) {
      if (e is ApiException && e.statusCode == 404) {
        return null; // Reading not found
      }
      throw SynastryException(
        'Failed to get synastry reading: ${e.toString()}',
      );
    }
  }

  Future<String> getSynastrySvg(
    int synastryId, {
    double zoom = 1.0,
  }) async {
    try {
      final svg = await _apiClient.getRawText(
        '/synastry/$synastryId/svg?zoom=${zoom.toString()}',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return svg;
    } catch (e) {
      throw SynastryException('Failed to get synastry SVG: ${e.toString()}');
    }
  }

  Future<String> getSynastryDetailsSvg(
    int synastryId, {
    required double zoom,
    required bool darkMode,
  }) async {
    try {
      final svg = await _apiClient.getRawText(
        '/synastry/$synastryId/svg-details?zoom=${zoom.toString()}&dark_mode=$darkMode',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return svg;
    } catch (e) {
      throw SynastryException('Failed to get synastry details SVG: ${e.toString()}');
    }
  }

  Future<String> getSynastryAspectGridSvg(
    int synastryId, {
    required double zoom,
    required bool darkMode,
  }) async {
    try {
      final svg = await _apiClient.getRawText(
        '/synastry/$synastryId/svg-aspect-grid?zoom=${zoom.toString()}&dark_mode=$darkMode',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return svg;
    } catch (e) {
      if (e is ApiException) rethrow;
      throw SynastryException('Failed to get synastry aspect grid SVG: ${e.toString()}');
    }
  }

  Future<void> deleteSynastry(int synastryId) async {
    try {
      await _apiClient.delete('/synastry/$synastryId');
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw SynastryException('Failed to delete synastry: ${e.toString()}');
    }
  }

  Stream<ReadingChunk> streamSynastryReading(int synastryId) async* {
    try {
      yield* _apiClient.streamReadingChunks(
        '/synastry/$synastryId/stream-reading',
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

  void dispose() {
    _apiClient.dispose();
  }
}

class SynastryException implements Exception {
  final String message;
  const SynastryException(this.message);
  @override
  String toString() => 'SynastryException: $message';
}

class SubscriptionRequiredException extends SynastryException {
  final String errorType;
  const SubscriptionRequiredException(super.message, {required this.errorType});

  @override
  String toString() => 'SubscriptionRequiredException: $message';
}
