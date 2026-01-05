import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_service.dart';
import '../models/user.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('it');
  static const String _languageKey = 'selected_language';
  static const List<String> _supportedLanguages = ['en', 'it'];
  
  final AuthService _authService = AuthService();
  User? _currentUser;

  Locale get currentLocale => _currentLocale;

  LanguageProvider() {
    _loadSavedLanguage();
  }

  void setCurrentUser(User? user) {
    _currentUser = user;
    if (user != null) {
      _currentLocale = Locale(user.preferredLanguage);
      notifyListeners();
    }
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey);

    if (languageCode != null) {
      _currentLocale = Locale(languageCode);
    } else {
      _currentLocale = _getSystemLocale();
    }
    notifyListeners();
  }

  Locale _getSystemLocale() {
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final systemLanguageCode = systemLocale.languageCode;

    if (_supportedLanguages.contains(systemLanguageCode)) {
      return Locale(systemLanguageCode);
    }

    return const Locale('it');
  }

  Future<void> changeLanguage(Locale locale) async {
    if (_currentLocale == locale) return;

    _currentLocale = locale;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, locale.languageCode);

    if (_currentUser != null) {
      try {
        await _authService.updateProfile({
          'preferredLanguage': locale.languageCode,
        });
      } catch (e) {
        debugPrint('Failed to update language preference in database: $e');
      }
    }

    notifyListeners();
  }
}
