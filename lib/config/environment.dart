import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Future<void> init() async {
    await dotenv.load(fileName: '.env.flutter');
  }

  static String get apiBaseUrl {
    if (kDebugMode) {
      return 'http://localhost:5005/api';
    }
    return 'https://astrogods.it/api';
  }

  static String get staticBaseUrl {
    final url = apiBaseUrl;
    return url.endsWith('/api') ? url.substring(0, url.length - 4) : url;
  }

  static String get appVersion => dotenv.env['APP_VERSION']!;
}
