import 'package:flutter/material.dart';
import 'api_client.dart';

class NewsletterSubscription {
  final int id;
  final int birthChartId;
  final String birthChartName;
  final double latitude;
  final double longitude;
  final String place;
  final DateTime createdOn;

  NewsletterSubscription({
    required this.id,
    required this.birthChartId,
    required this.birthChartName,
    required this.latitude,
    required this.longitude,
    required this.place,
    required this.createdOn,
  });

  factory NewsletterSubscription.fromJson(Map<String, dynamic> json) {
    return NewsletterSubscription(
      id: json['id'],
      birthChartId: json['birth_chart_id'],
      birthChartName: json['birth_chart_name'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      place: json['place'],
      createdOn: DateTime.parse(json['created_on']),
    );
  }
}

class NewsletterSubscriptions {
  final List<NewsletterSubscription> dailySubscriptions;
  final List<NewsletterSubscription> monthlySubscriptions;

  NewsletterSubscriptions({
    required this.dailySubscriptions,
    required this.monthlySubscriptions,
  });

  factory NewsletterSubscriptions.fromJson(Map<String, dynamic> json) {
    return NewsletterSubscriptions(
      dailySubscriptions: (json['daily_subscriptions'] as List)
          .map((item) => NewsletterSubscription.fromJson(item))
          .toList(),
      monthlySubscriptions: (json['monthly_subscriptions'] as List)
          .map((item) => NewsletterSubscription.fromJson(item))
          .toList(),
    );
  }
}

class NewsletterService {
  final BuildContext? context;
  late final ApiClient _apiClient;

  NewsletterService({this.context}) {
    _apiClient = ApiClient(context: context);
  }

  Future<NewsletterSubscriptions> getSubscriptions() async {
    try {
      final response = await _apiClient.get('/newsletter/subscriptions');
      return NewsletterSubscriptions.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> subscribeDailyNewsletter({
    required int birthChartId,
    required String placeId,
    required String place,
  }) async {
    try {
      await _apiClient.post('/newsletter/daily-newsletter', body: {
        'birth_chart_id': birthChartId,
        'place_id': placeId,
        'place': place,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> subscribeMonthlyNewsletter({
    required int birthChartId,
    required String placeId,
    required String place,
  }) async {
    try {
      await _apiClient.post('/newsletter/monthly-newsletter', body: {
        'birth_chart_id': birthChartId,
        'place_id': placeId,
        'place': place,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> unsubscribeDailyNewsletter(int newsletterId) async {
    try {
      await _apiClient.delete('/newsletter/daily-newsletter/$newsletterId');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> unsubscribeMonthlyNewsletter(int newsletterId) async {
    try {
      await _apiClient.delete('/newsletter/monthly-newsletter/$newsletterId');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDailyNewsletter({
    required int newsletterId,
    required int birthChartId,
    required String placeId,
    required String place,
  }) async {
    try {
      await _apiClient.put('/newsletter/daily-newsletter/$newsletterId', body: {
        'birth_chart_id': birthChartId,
        'place_id': placeId,
        'place': place,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateMonthlyNewsletter({
    required int newsletterId,
    required int birthChartId,
    required String placeId,
    required String place,
  }) async {
    try {
      await _apiClient.put('/newsletter/monthly-newsletter/$newsletterId', body: {
        'birth_chart_id': birthChartId,
        'place_id': placeId,
        'place': place,
      });
    } catch (e) {
      rethrow;
    }
  }
}