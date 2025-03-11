import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_hitch/repository/auth_repository/auth_repository.dart';
import 'package:quick_hitch/view_model/services/session_manager.dart/session_controller.dart';

class GoogleSignInProvider with ChangeNotifier {
  final AuthRepository authRepository = AuthRepository();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: dotenv.env['WEB_CLIENT_ID'],
    scopes: [
      'email',
      'profile',
      'openid',
    ],
  );

  bool _googleSignInLoading = false;
  bool get googleSignInLoading => _googleSignInLoading;

  void setGoogleSignInLoading(bool value) {
    _googleSignInLoading = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> googleSignIn() async {
    try {
      setGoogleSignInLoading(true);

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        log("Google Sign-In cancelled.");
        setGoogleSignInLoading(false);
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final String? idToken = googleAuth.idToken;
      if (idToken == null) {
        log("Error: Google ID Token is null.");
        setGoogleSignInLoading(false);
        return null;
      }

      log("Google ID Token: $idToken");

      // Send ID Token to backend
      final response = await authRepository.googleSigninApi(idToken);
      // Save session data
      await SessionController()
          .saveUserInPreference(response['user']['id'], response['token']);
      await SessionController().getUserFromPreference();

      log("Google Sign-In API Response: $response");

      setGoogleSignInLoading(false);
      return response;
    } catch (e) {
      log("Google Sign-In Error: $e");
      setGoogleSignInLoading(false);
      return null;
    } finally {
      setGoogleSignInLoading(false);
    }
  }
}
