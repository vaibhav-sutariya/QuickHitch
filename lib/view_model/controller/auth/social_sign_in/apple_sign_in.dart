import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/repository/auth_repository/auth_repository.dart';

class AppleSignIn with ChangeNotifier {
  AuthRepository authRepository = AuthRepository();
  bool _appleSignInLoading = false;
  bool get appleSignInLoading => _appleSignInLoading;

  setAppleSignInLoading(bool value) {
    _appleSignInLoading = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> appleSignIn() async {
    try {
      setAppleSignInLoading(true);
      final response = await authRepository.appleSigninApi();
      log("Apple Signin Response: $response");
      setAppleSignInLoading(false);
      return {};
    } catch (e) {
      setAppleSignInLoading(false);
      log("Apple Signin Error: $e");
      return {
        "success": false,
        "message": "Apple Sign-In failed. Please try again later.",
        "error": e.toString(),
      };
      // throw Exception(e);
    } finally {
      setAppleSignInLoading(false);
    }
  }
}
