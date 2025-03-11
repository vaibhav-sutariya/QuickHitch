import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:quick_hitch/repository/auth_repository/auth_repository.dart';

class RegisterViewModel with ChangeNotifier {
  AuthRepository authRepository = AuthRepository();
  RegisterViewModel();

  bool _registerLoading = false;
  bool get registerLoading => _registerLoading;

  setRegisterLoading(bool value) {
    _registerLoading = value;
    notifyListeners();
  }

  // Getter and setter for firstname
  String _firstname = '';
  String get firstname => _firstname;
  setFirstname(String firstname) {
    _firstname = firstname;
  }

  // Getter and setter for username
  String _lastname = '';
  String get lastname => _lastname;
  setLastname(String lastname) {
    _lastname = lastname;
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

  Future<Map<String, dynamic>> registerUser() async {
    try {
      setRegisterLoading(true);
      final data = {
        "firstName": firstname,
        "lastName": lastname,
        "email": email,
        "password": password,
      };
      final response = await authRepository.registerApi(data);
      // log("Register Response: $response");
      log('Register success'); // ✅ Debugging Step
      setRegisterLoading(false);
      return response;
    } catch (e) {
      log("Register Error: $e"); // Add this log
      setRegisterLoading(false);
      throw Exception(e);
    } finally {
      setRegisterLoading(false);
    }
  }
}
