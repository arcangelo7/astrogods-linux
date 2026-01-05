import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../models/auth_request.dart';
import 'api_client.dart';

class AuthService {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  final ApiClient _apiClient;

  AuthService({ApiClient? apiClient, BuildContext? context})
    : _apiClient = apiClient ?? ApiClient(context: context);

  static String extractUserMessage(dynamic error) {
    if (error is ApiException) {
      return error.userMessage;
    }
    return error.toString();
  }

  Future<AuthResponse> login(String email, String password) async {
    try {
      final request = LoginRequest(email: email, password: password);
      final response = await _apiClient.post('/login', body: request.toJson());

      // Check if the response has token and user (successful login)
      if (response.containsKey('token') && response.containsKey('user')) {
        final user = User.fromJson(response['user']);
        final token = response['token'] as String;

        await _saveUserSession(user, token);

        return AuthResponse(success: true, user: user, token: token);
      }

      // Try to parse as standard AuthResponse (for error cases)
      final authResponse = AuthResponse.fromJson(response);
      return authResponse;
    } catch (e) {
      return AuthResponse(success: false, message: extractUserMessage(e));
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _apiClient.post(
        '/register',
        body: request.toJson(),
      );

      // Check if the response has token and user (successful registration)
      if (response.containsKey('token') && response.containsKey('user')) {
        final user = User.fromJson(response['user']);
        final token = response['token'] as String;

        await _saveUserSession(user, token);

        return AuthResponse(success: true, user: user, token: token);
      }

      // Try to parse as standard AuthResponse (for error cases)
      final authResponse = AuthResponse.fromJson(response);
      return authResponse;
    } catch (e) {
      return AuthResponse(success: false, message: extractUserMessage(e));
    }
  }

  Future<AuthResponse> loginWithGoogle({required String idToken}) async {
    try {
      final response = await _apiClient.post(
        '/google-auth',
        body: {'idToken': idToken},
      );

      if (response.containsKey('token') && response.containsKey('user')) {
        final user = User.fromJson(response['user']);
        final token = response['token'] as String;

        await _saveUserSession(user, token);

        return AuthResponse(success: true, user: user, token: token);
      }

      // Try to parse as standard AuthResponse (for error cases)
      final authResponse = AuthResponse.fromJson(response);
      return authResponse;
    } catch (e) {
      return AuthResponse(success: false, message: extractUserMessage(e));
    }
  }

  Future<bool> logout() async {
    try {
      await _apiClient.post('/logout');
    } catch (e) {
      // Continue with local logout even if server logout fails
    }

    await _clearUserSession();
    return true;
  }

  Future<User?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString(_userKey);

      if (userData != null) {
        final userJson = json.decode(userData) as Map<String, dynamic>;
        return User.fromJson(userJson);
      }
    } catch (e) {
      // User data is corrupted, clear it
      await _clearUserSession();
    }

    return null;
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<bool> isLoggedIn() async {
    final user = await getCurrentUser();
    final token = await getToken();
    return user != null && token != null;
  }

  Future<AuthResponse> refreshUserData() async {
    try {
      final response = await _apiClient.get('/me');
      final user = User.fromJson(response['user']);

      await _saveUserData(user);

      return AuthResponse(success: true, user: user);
    } catch (e) {
      return AuthResponse(success: false, message: extractUserMessage(e));
    }
  }

  Future<AuthResponse> updateProfile(Map<String, dynamic> profileData) async {
    try {
      final response = await _apiClient.put(
        '/update-profile',
        body: profileData,
      );
      final user = User.fromJson(response['user']);

      await _saveUserData(user);

      return AuthResponse(success: true, user: user);
    } catch (e) {
      return AuthResponse(success: false, message: extractUserMessage(e));
    }
  }

  Future<bool> checkEmailExists(String email) async {
    try {
      final response = await _apiClient.post(
        '/check-email',
        body: {'email': email},
      );
      return response['exists'] == true;
    } catch (e) {
      throw Exception(extractUserMessage(e));
    }
  }

  Future<void> _saveUserSession(User user, String? token) async {
    final prefs = await SharedPreferences.getInstance();

    if (token != null) {
      await prefs.setString(_tokenKey, token);
    }

    await _saveUserData(user);
  }

  Future<void> _saveUserData(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, json.encode(user.toJson()));
  }

  Future<void> _clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }

  Future<AuthResponse> deleteAccount() async {
    try {
      await _apiClient.delete('/delete-account');
      await _clearUserSession();
      return AuthResponse(
        success: true,
        message: 'Account deleted successfully',
      );
    } catch (e) {
      return AuthResponse(success: false, message: extractUserMessage(e));
    }
  }

  Future<AuthResponse> forgotPassword(String email) async {
    try {
      await _apiClient.post('/forgot-password', body: {'email': email});
      return AuthResponse(success: true, message: 'Password reset email sent');
    } catch (e) {
      return AuthResponse(success: false, message: extractUserMessage(e));
    }
  }

  Future<AuthResponse> resetPassword(String token, String newPassword) async {
    try {
      await _apiClient.post(
        '/reset-password',
        body: {'token': token, 'password': newPassword},
      );
      return AuthResponse(
        success: true,
        message: 'Password reset successfully',
      );
    } catch (e) {
      return AuthResponse(success: false, message: extractUserMessage(e));
    }
  }
}
