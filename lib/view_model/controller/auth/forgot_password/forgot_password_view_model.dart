import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/repository/auth_repository/forgot_password_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class ForgotPasswordViewModel with ChangeNotifier {
  ForgotPasswordViewModel();
  ForgotPasswordRepository forgotPasswordRepository =
      ForgotPasswordRepository();

  bool _forgotPasswordLoading = false;
  bool get forgotPasswordLoading => _forgotPasswordLoading;

  setForgotPasswordLoading(bool value) {
    _forgotPasswordLoading = value;
    notifyListeners();
  }

  // Getter and setter for email
  String _email = '';
  String get email => _email;
  setEmail(String email) {
    _email = email;
  }

  Future<Map<String, dynamic>> forgotPassword() async {
    try {
      setForgotPasswordLoading(true);
      final data = {'email': email};
      final token = await getToken();
      log("Forgot Password Token: $token");
      final response =
          await forgotPasswordRepository.forgotPasswordApi(data, token);

      log("Forgot Password Response: $response");
      return response;
    } catch (e) {
      log("Forgot Password Error: $e");
      throw Exception(e.toString());
    } finally {
      setForgotPasswordLoading(false);
    }
  }
}
