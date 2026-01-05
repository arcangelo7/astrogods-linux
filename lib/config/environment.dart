import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class Environment {
  static Future<void> init() async {
    String envFile;

    if (kDebugMode) {
      if (kIsWeb) {
        envFile = '.env.flutter.web';
      } else if (Platform.isAndroid || Platform.isIOS) {
        envFile = '.env.flutter.mobile';
      } else {
        envFile = '.env.flutter.desktop';
      }
    } else {
      envFile = '.env.flutter.prod';
    }

    await dotenv.load(fileName: envFile);
  }

  static String get apiBaseUrl {
    final url = dotenv.env['API_BASE_URL'];
    if (url == null || url.isEmpty) {
      throw Exception('API_BASE_URL must be set in .env file');
    }

    if (_isAndroidEmulator() && url.contains('localhost')) {
      return url.replaceAll('localhost', '10.0.2.2');
    }

    return url;
  }

  static String get staticBaseUrl {
    final url = apiBaseUrl;
    return url.endsWith('/api') ? url.substring(0, url.length - 4) : url;
  }

  static bool _isAndroidEmulator() {
    if (kIsWeb) return false;

    try {
      return Platform.isAndroid && kDebugMode;
    } catch (e) {
      return false;
    }
  }

  static String get appVersion {
    final version = dotenv.env['APP_VERSION'];
    if (version == null || version.isEmpty) {
      throw Exception('APP_VERSION must be set in .env file');
    }
    return version;
  }

  static String get googleOAuthClientId {
    final clientId = dotenv.env['GOOGLE_OAUTH_CLIENT_ID'];
    if (clientId == null || clientId.isEmpty) {
      throw Exception('GOOGLE_OAUTH_CLIENT_ID must be set in .env file');
    }
    return clientId;
  }

  static String? get googleOAuthClientSecret {
    return dotenv.env['GOOGLE_OAUTH_CLIENT_SECRET'];
  }
}
