import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/repository/auth_repository/auth_repository.dart';
import 'package:quick_hitch/view_model/services/session_manager.dart/session_controller.dart';

class LoginViewModel with ChangeNotifier {
  AuthRepository authRepository = AuthRepository();
  LoginViewModel();

  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;

  setRegisterLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  // Getter and setter for email
  String _email = '';
  String get email => _email;
  setEmail(String email) {
    _email = email;
  }

  // Getter and setter for password
  String _password = '';
  String get password => _password;
  setPassword(String password) {
    _password = password;
  }

  Future<Map<String, dynamic>> loginUser() async {
    try {
      setRegisterLoading(true);
      final data = {
        "email": email,
        "password": password,
      };
      final response = await authRepository.loginApi(data);
      final token = response['token'];
      final id = response['user']['id'];
      await SessionController().saveUserInPreference(id, token);
      await SessionController().getUserFromPreference();
      log("Login Response: $response");
      setRegisterLoading(false);
      return response;
    } catch (e) {
      setRegisterLoading(false);
      log("Login Error: $e");
      rethrow; // Instead of throwing a generic exception, pass the actual error
    } finally {
      setRegisterLoading(false);
    }
  }
}
