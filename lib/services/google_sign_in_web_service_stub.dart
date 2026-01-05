import 'dart:async';
import '../models/google_user_data.dart';

class GoogleSignInWebService {
  static final GoogleSignInWebService _instance =
      GoogleSignInWebService._internal();
  factory GoogleSignInWebService() => _instance;
  GoogleSignInWebService._internal();

  Future<GoogleUserData?> signIn() async {
    throw UnsupportedError('Google Sign-In is only supported on web platform');
  }
}
