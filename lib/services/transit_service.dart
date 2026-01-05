import 'package:flutter/material.dart';
import '../models/reading_chunk.dart';
import '../models/transit.dart';
import 'api_client.dart';

class TransitService {
  final ApiClient _apiClient;

  TransitService({ApiClient? apiClient, BuildContext? context})
    : _apiClient = apiClient ?? ApiClient(context: context);

  void dispose() {}

  Stream<ReadingChunk> streamDailyTransit(int transitId) async* {
    try {
      yield* _apiClient.streamReadingChunks(
        '/transits/daily/stream?transit_id=$transitId',
      );
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
      throw TransitException(e.toString());
    }
  }

  Stream<ReadingChunk> streamMonthlyTransit(int transitId) async* {
    try {
      yield* _apiClient.streamReadingChunks(
        '/transits/monthly/stream?transit_id=$transitId',
      );
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
      throw TransitException(e.toString());
    }
  }

  Future<DailyTransitReading> getDailyTransit(int readingId) async {
    try {
      final response = await _apiClient.get('/transits/daily/$readingId');
      return DailyTransitReading.fromJson(response);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw TransitException(e.toString());
    }
  }

  Future<MonthlyTransitReading> getMonthlyTransit(int readingId) async {
    try {
      final response = await _apiClient.get('/transits/monthly/$readingId');
      return MonthlyTransitReading.fromJson(response);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw TransitException(e.toString());
    }
  }

  Future<Map<String, dynamic>> getDailyTransitReading(int readingId) async {
    try {
      final response = await _apiClient.get('/transits/daily/$readingId');
      return response;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw TransitException(e.toString());
    }
  }

  Future<Map<String, dynamic>> getMonthlyTransitReading(int readingId) async {
    try {
      final response = await _apiClient.get('/transits/monthly/$readingId');
      return response;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw TransitException(e.toString());
    }
  }

  Future<Map<String, dynamic>> createDailyTransit({
    required int birthChartId,
    required DateTime date,
    required Map<String, dynamic> location,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'birth_chart_id': birthChartId,
        'date': date.toIso8601String(),
        'place': location['place'],
      };

      if (location['placeId'] != null) {
        body['place_id'] = location['placeId'];
      }
      if (location['latitude'] != null) {
        body['latitude'] = location['latitude'];
      }
      if (location['longitude'] != null) {
        body['longitude'] = location['longitude'];
      }

      final response = await _apiClient.post(
        '/transits/daily',
        body: body,
      );

      return response['transit'];
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
      throw TransitException(e.toString());
    }
  }

  Future<Map<String, dynamic>> createMonthlyTransit({
    required int birthChartId,
    required int year,
    required int month,
    required Map<String, dynamic> location,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'birth_chart_id': birthChartId,
        'year': year,
        'month': month,
        'place': location['place'],
      };

      if (location['placeId'] != null) {
        body['place_id'] = location['placeId'];
      }
      if (location['latitude'] != null) {
        body['latitude'] = location['latitude'];
      }
      if (location['longitude'] != null) {
        body['longitude'] = location['longitude'];
      }

      final response = await _apiClient.post(
        '/transits/monthly',
        body: body,
      );

      return response['transit'];
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
      throw TransitException(e.toString());
    }
  }

  Future<String> getDailyTransitSvg(
    int transitId, {
    required double zoom,
  }) async {
    try {
      final response = await _apiClient.getRawText(
        '/transits/daily/$transitId/svg?zoom=$zoom',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return response;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw TransitException(e.toString());
    }
  }

  Future<String> getMonthlyTransitSvg(
    int transitId, {
    required double zoom,
  }) async {
    try {
      final response = await _apiClient.getRawText(
        '/transits/monthly/$transitId/svg?zoom=$zoom',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return response;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw TransitException(e.toString());
    }
  }

  Future<String> getDailyTransitDetailsSvg(
    int transitId, {
    required double zoom,
    required bool darkMode,
  }) async {
    try {
      final response = await _apiClient.getRawText(
        '/transits/daily/$transitId/svg-details?zoom=$zoom&dark_mode=$darkMode',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return response;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw TransitException(e.toString());
    }
  }

  Future<String> getMonthlyTransitDetailsSvg(
    int transitId, {
    required double zoom,
    required bool darkMode,
  }) async {
    try {
      final response = await _apiClient.getRawText(
        '/transits/monthly/$transitId/svg-details?zoom=$zoom&dark_mode=$darkMode',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return response;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw TransitException(e.toString());
    }
  }

  Future<String> getDailyTransitAspectGridSvg(
    int transitId, {
    required double zoom,
    required bool darkMode,
  }) async {
    try {
      final response = await _apiClient.getRawText(
        '/transits/daily/$transitId/svg-aspect-grid?zoom=$zoom&dark_mode=$darkMode',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return response;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw TransitException(e.toString());
    }
  }

  Future<String> getMonthlyTransitAspectGridSvg(
    int transitId, {
    required double zoom,
    required bool darkMode,
  }) async {
    try {
      final response = await _apiClient.getRawText(
        '/transits/monthly/$transitId/svg-aspect-grid?zoom=$zoom&dark_mode=$darkMode',
        extraHeaders: {'Accept': 'image/svg+xml'},
      );
      return response;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw TransitException(e.toString());
    }
  }
}

class TransitException implements Exception {
  final String message;

  TransitException(this.message);

  @override
  String toString() => 'TransitException: $message';
}

class SubscriptionRequiredException extends TransitException {
  final String? errorType;

  SubscriptionRequiredException(
    super.message, {
    this.errorType,
  });

  @override
  String toString() => 'SubscriptionRequiredException: $message';
}