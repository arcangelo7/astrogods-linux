import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import '../models/google_user_data.dart';
import 'google_sign_in_desktop_service.dart';

class GoogleSignInNativeService {
  static final GoogleSignInNativeService _instance =
      GoogleSignInNativeService._internal();
  factory GoogleSignInNativeService() => _instance;
  GoogleSignInNativeService._internal();

  GoogleSignInAccount? _currentUser;
  bool _isInitialized = false;
  StreamSubscription<GoogleSignInAuthenticationEvent>? _authSubscription;

  Future<void> initialize(String? clientId) async {
    if (_isInitialized) return;

    final GoogleSignIn signIn = GoogleSignIn.instance;

    if (kIsWeb) {
      await signIn.initialize();
    } else {
      if (Platform.isAndroid) {
        await signIn.initialize(serverClientId: clientId);
      } else if (Platform.isIOS) {
        await signIn.initialize();
      } else {
        throw Exception('Use GoogleSignInDesktopService for desktop platforms');
      }
    }

    _authSubscription?.cancel();
    _authSubscription =
        signIn.authenticationEvents.listen(_handleAuthenticationEvent);
    await signIn.attemptLightweightAuthentication();
    _isInitialized = true;
  }

  void _handleAuthenticationEvent(GoogleSignInAuthenticationEvent event) {
    switch (event) {
      case GoogleSignInAuthenticationEventSignIn():
        _currentUser = event.user;
        break;
      case GoogleSignInAuthenticationEventSignOut():
        _currentUser = null;
        break;
    }
  }

  Future<GoogleUserData?> signIn() async {
    if (!kIsWeb && (Platform.isLinux || Platform.isWindows)) {
      return GoogleSignInDesktopService().signIn();
    }

    try {
      if (!_isInitialized) {
        throw Exception(
            'GoogleSignInNativeService not initialized. Call initialize() first.');
      }

      if (GoogleSignIn.instance.supportsAuthenticate()) {
        await GoogleSignIn.instance.authenticate();
      } else {
        throw Exception('Authentication not supported on this platform');
      }

      if (_currentUser == null) {
        return null;
      }

      final GoogleSignInAuthentication auth = _currentUser!.authentication;

      return GoogleUserData(
        id: _currentUser!.id,
        name: _currentUser!.displayName ?? '',
        email: _currentUser!.email,
        imageUrl: _currentUser!.photoUrl ?? '',
        idToken: auth.idToken ?? '',
      );
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }
      rethrow;
    } catch (e) {
      throw Exception('Google Sign-In failed: $e');
    }
  }

  Future<bool> signOut() async {
    if (!kIsWeb && (Platform.isLinux || Platform.isWindows)) {
      return GoogleSignInDesktopService().signOut();
    }

    try {
      await GoogleSignIn.instance.disconnect();
      _currentUser = null;
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isSignedIn() {
    return _currentUser != null;
  }
}
