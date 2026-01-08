import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../services/api_client.dart';
import '../config/environment.dart';
import '../providers/language_provider.dart';

import 'platform/url_launcher_stub.dart'
  if (dart.library.html) 'platform/url_launcher_web.dart'
  if (dart.library.io) 'platform/url_launcher_mobile.dart' as platform;

class CheckoutException implements Exception {
  final String message;
  CheckoutException(this.message);

  @override
  String toString() => message;
}

class StripeService {
  static String get baseUrl => Environment.apiBaseUrl;

  static Future<Map<String, dynamic>> createPaymentIntent(
    BuildContext context,
    String priceId,
  ) async {
    try {
      final languageProvider = Provider.of<LanguageProvider>(
        context,
        listen: false,
      );
      final languageCode = languageProvider.currentLocale.languageCode;

      final authService = AuthService();
      final token = await authService.getToken();

      if (token == null) {
        throw ApiException('User not authenticated', statusCode: 401);
      }

      final response = await http.post(
        Uri.parse('$baseUrl/create-payment-intent'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'Accept-Language': languageCode,
          'X-Client-Version': Environment.appVersion,
        },
        body: json.encode({
          'price_id': priceId,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        final error = json.decode(response.body);
        throw ApiException(
          error['error'] as String,
          statusCode: response.statusCode,
          errorType: error['error_type'],
          errorKey: error['error_key'],
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('Unable to start checkout process');
    }
  }

  static Future<void> presentPaymentSheet() async {
    if (kIsWeb) {
      throw Exception('Payment Sheet not available on web');
    }

    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw CheckoutException('Payment cancelled or failed');
    }
  }

  static Future<void> initPaymentSheet({
    required String setupIntentClientSecret,
    required String customerId,
    required String customerEphemeralKeySecret,
  }) async {
    if (kIsWeb) {
      throw Exception('Payment Sheet not available on web');
    }

    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          setupIntentClientSecret: setupIntentClientSecret,
          merchantDisplayName: 'AstroGods',
          customerId: customerId,
          customerEphemeralKeySecret: customerEphemeralKeySecret,
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'IT',
            currencyCode: 'EUR',
            testEnv: kDebugMode,
          ),
        ),
      );
    } catch (e) {
      throw CheckoutException('Failed to initialize payment sheet');
    }
  }

  static Future<String?> createCheckoutSession(
    BuildContext context,
    String priceId,
  ) async {
    try {
      final languageProvider = Provider.of<LanguageProvider>(
        context,
        listen: false,
      );
      final languageCode = languageProvider.currentLocale.languageCode;

      final authService = AuthService();
      final token = await authService.getToken();

      if (token == null) {
        throw ApiException('User not authenticated', statusCode: 401);
      }

      final response = await http.post(
        Uri.parse('$baseUrl/create-checkout-session'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'Accept-Language': languageCode,
          'X-Client-Version': Environment.appVersion,
        },
        body: json.encode({
          'price_id': priceId,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['checkout_url'];
      } else {
        final error = json.decode(response.body);
        throw ApiException(
          error['error'] as String,
          statusCode: response.statusCode,
          errorType: error['error_type'],
          errorKey: error['error_key'],
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('Unable to start checkout process');
    }
  }

  static Future<void> createSubscriptionFromSetup({
    required BuildContext context,
    required String customerId,
    required String priceId,
  }) async {
    try {
      final languageProvider = Provider.of<LanguageProvider>(
        context,
        listen: false,
      );
      final languageCode = languageProvider.currentLocale.languageCode;

      final authService = AuthService();
      final token = await authService.getToken();

      if (token == null) {
        throw ApiException('User not authenticated', statusCode: 401);
      }

      final response = await http.post(
        Uri.parse('$baseUrl/create-subscription-from-setup'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'Accept-Language': languageCode,
          'X-Client-Version': Environment.appVersion,
        },
        body: json.encode({
          'customer_id': customerId,
          'price_id': priceId,
        }),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        final error = json.decode(response.body);
        throw ApiException(
          error['error'] as String,
          statusCode: response.statusCode,
          errorType: error['error_type'],
          errorKey: error['error_key'],
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('Failed to create subscription');
    }
  }

  static Future<void> launchStripeCheckout(String checkoutUrl) async {
    try {
      await platform.launchUrl(checkoutUrl);
    } catch (e) {
      throw Exception('Error launching checkout: $e');
    }
  }
  
  static Future<void> confirmSession(
    BuildContext context,
    String sessionId,
  ) async {
    try {
      final languageProvider = Provider.of<LanguageProvider>(
        context,
        listen: false,
      );
      final languageCode = languageProvider.currentLocale.languageCode;

      final authService = AuthService();
      final token = await authService.getToken();

      if (token == null) {
        throw ApiException('User not authenticated', statusCode: 401);
      }

      final response = await http.post(
        Uri.parse('$baseUrl/confirm-session'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'Accept-Language': languageCode,
          'X-Client-Version': Environment.appVersion,
        },
        body: json.encode({
          'session_id': sessionId,
        }),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        final error = json.decode(response.body);
        throw ApiException(
          error['error'] as String,
          statusCode: response.statusCode,
          errorType: error['error_type'],
          errorKey: error['error_key'],
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('Failed to confirm session');
    }
  }
}