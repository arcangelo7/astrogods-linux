import 'package:google_sign_in_all_platforms/google_sign_in_all_platforms.dart';

import '../config/environment.dart';
import '../models/google_user_data.dart';

class GoogleSignInDesktopService {
  static final GoogleSignInDesktopService _instance =
      GoogleSignInDesktopService._internal();
  factory GoogleSignInDesktopService() => _instance;
  GoogleSignInDesktopService._internal();

  GoogleSignIn? _googleSignIn;

  GoogleSignIn _getGoogleSignIn() {
    final clientSecret = Environment.googleOAuthClientSecret;
    if (clientSecret == null) {
      throw Exception('GOOGLE_OAUTH_CLIENT_SECRET must be set for desktop');
    }

    _googleSignIn ??= GoogleSignIn(
      params: GoogleSignInParams(
        clientId: Environment.googleOAuthClientId,
        clientSecret: clientSecret,
        scopes: ['openid', 'profile', 'email'],
        redirectPort: 9876,
      ),
    );
    return _googleSignIn!;
  }

  Future<GoogleUserData?> signIn() async {
    final googleSignIn = _getGoogleSignIn();
    // Sign out first to clear any cached expired tokens
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
