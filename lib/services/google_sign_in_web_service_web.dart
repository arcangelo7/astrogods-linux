import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/google_user_data.dart';

class GoogleSignInWebService {
  static final GoogleSignInWebService _instance =
      GoogleSignInWebService._internal();
  factory GoogleSignInWebService() => _instance;
  GoogleSignInWebService._internal();

  GoogleSignInAccount? _currentUser;
  bool _isInitialized = false;
  StreamSubscription<GoogleSignInAuthenticationEvent>? _authSubscription;

  Future<void> _initialize() async {
    if (_isInitialized) return;

    final GoogleSignIn signIn = GoogleSignIn.instance;
    await signIn.initialize();

    _authSubscription?.cancel();
    _authSubscription = signIn.authenticationEvents.listen(_handleAuthenticationEvent);
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
    try {
      await _initialize();

      // On web, the user must interact with the Google button rendered by renderButton()
      // This method waits for authentication to complete via authenticationEvents
      // The _currentUser will be set by _handleAuthenticationEvent when user signs in

      if (_currentUser == null) {
        // User hasn't signed in yet via the Google button
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
    } catch (e) {
      rethrow;
    }
  }

  GoogleUserData? getCurrentUser() {
    if (_currentUser == null) return null;

    final GoogleSignInAuthentication auth = _currentUser!.authentication;

    return GoogleUserData(
      id: _currentUser!.id,
      name: _currentUser!.displayName ?? '',
      email: _currentUser!.email,
      imageUrl: _currentUser!.photoUrl ?? '',
      idToken: auth.idToken ?? '',
    );
  }

  Future<void> signOut() async {
    await GoogleSignIn.instance.disconnect();
    _currentUser = null;
  }
}
