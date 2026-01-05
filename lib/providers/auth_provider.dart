import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/auth_request.dart';
import '../services/auth_service.dart';
import '../services/api_client.dart';
import '../config/environment.dart';
import 'language_provider.dart';
import 'theme_provider.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;

  User? _currentUser;
  bool _isAuthenticated = false;
  bool _isLoading = false;
  bool _hasInitialized = false;
  String? _errorMessage;
  LanguageProvider? _languageProvider;
  ThemeProvider? _themeProvider;

  AuthProvider({AuthService? authService})
    : _authService = authService ?? AuthService() {
    _checkInitialAuthState();
  }

  void setLanguageProvider(LanguageProvider languageProvider) {
    _languageProvider = languageProvider;
  }

  void setThemeProvider(ThemeProvider themeProvider) {
    _themeProvider = themeProvider;
  }

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading || !_hasInitialized;
  String? get errorMessage => _errorMessage;

  Future<void> _checkInitialAuthState() async {
    try {
      final isLoggedIn = await _authService.isLoggedIn();
      _isAuthenticated = isLoggedIn;
      _hasInitialized = true;
      notifyListeners();
    } catch (e) {
      _hasInitialized = true;
      notifyListeners();
    }
  }

  Future<void> initialize() async {
    if (!_hasInitialized) {
      await _checkInitialAuthState();
    }
    
    _setLoading(true);
    try {
      final user = await _authService.getCurrentUser();
      if (user != null) {
        _currentUser = user;
        _isAuthenticated = true;
        _syncUserWithProviders();
      } else {
        _isAuthenticated = false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      _isAuthenticated = false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> login(String email, String password, {BuildContext? context}) async {
    _setLoading(true);
    _clearError();

    try {
      final authService = AuthService(context: context);
      final response = await authService.login(email, password);

      if (response.success && response.user != null) {
        _currentUser = response.user;
        _isAuthenticated = true;
        _syncUserWithProviders();
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> register(RegisterRequest request, {BuildContext? context}) async {
    _setLoading(true);
    _clearError();

    try {
      final authService = AuthService(context: context);
      final response = await authService.register(request);

      if (response.success && response.user != null) {
        _currentUser = response.user;
        _isAuthenticated = true;
        _syncUserWithProviders();
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> loginWithGoogle({
    required String idToken,
    BuildContext? context,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final authService = AuthService(context: context);
      final response = await authService.loginWithGoogle(
        idToken: idToken,
      );

      if (response.success && response.user != null) {
        _currentUser = response.user;
        _isAuthenticated = true;
        _syncUserWithProviders();
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);

    try {
      await _authService.logout();

      _currentUser = null;
      _isAuthenticated = false;

      notifyListeners();
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
    } finally {
      _setLoading(false);
    }
  }

  void clearSessionAfterAccountDeletion() {
    _setLoading(true);

    try {
      _currentUser = null;
      _isAuthenticated = false;

      notifyListeners();
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> refreshUserData() async {
    if (!_isAuthenticated) return;

    try {
      final response = await _authService.refreshUserData();
      if (response.success && response.user != null) {
        _currentUser = response.user;
        _syncUserWithProviders();
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
    }
  }

  Future<bool> updateProfile(Map<String, dynamic> profileData) async {
    if (!_isAuthenticated) return false;

    _setLoading(true);
    _clearError();

    try {
      final response = await _authService.updateProfile(profileData);

      if (response.success && response.user != null) {
        _currentUser = response.user;
        _syncUserWithProviders();
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> checkEmailExists(String email) async {
    _clearError();

    try {
      return await _authService.checkEmailExists(email);
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      return false;
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void stopLoading() {
    _setLoading(false);
  }

  void _clearError() {
    _errorMessage = null;
  }

  void _syncUserWithLanguageProvider() {
    if (_languageProvider != null && _currentUser != null) {
      _languageProvider!.setCurrentUser(_currentUser);
    }
  }

  void _syncUserWithThemeProvider() {
    if (_themeProvider != null && _currentUser != null) {
      _themeProvider!.setCurrentUser(_currentUser);
    }
  }

  void _syncUserWithProviders() {
    _syncUserWithLanguageProvider();
    _syncUserWithThemeProvider();
  }

  void clearError() {
    _clearError();
    notifyListeners();
  }

  Future<User?> uploadProfilePictureBytes(Uint8List imageBytes) async {
    _setLoading(true);
    _clearError();

    try {
      final token = await _authService.getToken();
      if (token == null) {
        _errorMessage = 'Not authenticated';
        notifyListeners();
        return null;
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${ApiClient.baseUrl}/upload-profile-picture'),
      );

      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'X-Client-Version': Environment.appVersion,
      });

      request.files.add(
        http.MultipartFile.fromBytes(
          'profile_picture',
          imageBytes,
          filename: 'profile.webp',
        ),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['user'] != null) {
          final user = User.fromJson(data['user']);
          _currentUser = user;
          notifyListeners();
          return user;
        }
      } else {
        final data = json.decode(response.body);
        _errorMessage = data['error']!;
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
    } finally {
      _setLoading(false);
    }
    
    return null;
  }

  Future<User?> uploadProfilePicture(File imageFile) async {
    _setLoading(true);
    _clearError();

    try {
      final token = await _authService.getToken();
      if (token == null) {
        _errorMessage = 'Not authenticated';
        notifyListeners();
        return null;
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${ApiClient.baseUrl}/upload-profile-picture'),
      );

      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'X-Client-Version': Environment.appVersion,
      });

      request.files.add(
        await http.MultipartFile.fromPath(
          'profile_picture',
          imageFile.path,
        ),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['user'] != null) {
          final user = User.fromJson(data['user']);
          _currentUser = user;
          notifyListeners();
          return user;
        }
      } else {
        final data = json.decode(response.body);
        _errorMessage = data['error']!;
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
    } finally {
      _setLoading(false);
    }
    
    return null;
  }

  Future<bool> forgotPassword(String email) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _authService.forgotPassword(email);

      if (response.success) {
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> resetPassword(String token, String newPassword) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _authService.resetPassword(token, newPassword);

      if (response.success) {
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

}
