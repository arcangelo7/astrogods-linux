import 'package:google_sign_in_all_platforms/google_sign_in_all_platforms.dart';

import '../models/google_user_data.dart';

class GoogleSignInDesktopService {
  static final GoogleSignInDesktopService _instance =
      GoogleSignInDesktopService._internal();
  factory GoogleSignInDesktopService() => _instance;
  GoogleSignInDesktopService._internal();

  GoogleSignIn? _googleSignIn;

  Future<void> initialize(String clientId, String clientSecret) async {
    _googleSignIn = GoogleSignIn(
      params: GoogleSignInParams(
        clientId: clientId,
        clientSecret: clientSecret,
        scopes: ['openid', 'profile', 'email'],
        redirectPort: 9876,
      ),
    );
  }

  GoogleSignIn _getGoogleSignIn() {
    if (_googleSignIn == null) {
      throw Exception(
          'GoogleSignInDesktopService not initialized. Call initialize() first.');
    }
    return _googleSignIn!;
  }

  Future<GoogleUserData?> signIn() async {
    final googleSignIn = _getGoogleSignIn();
    await googleSignIn.signOut();
    final credentials = await googleSignIn.signIn();

    if (credentials == null) {
      return null;
    }

    return GoogleUserData(
      id: '',
      name: '',
      email: '',
      imageUrl: '',
      idToken: credentials.idToken!,
    );
  }

  Future<bool> signOut() async {
    final googleSignIn = _getGoogleSignIn();
    await googleSignIn.signOut();
    return true;
  }
}
