import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/repository/profile_repository/change_password_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class ChangePasswordViewModel with ChangeNotifier {
  ChangePasswordViewModel();
  ChangePasswordRepository changePasswordRepository =
      ChangePasswordRepository();

  bool _changePasswordLoading = false;
  bool get changePasswordLoading => _changePasswordLoading;

  setChangePasswordLoading(bool value) {
    _changePasswordLoading = value;
    notifyListeners();
  }

  // Getter and setter for email
  String _oldPassword = '';
  String get oldPassword => _oldPassword;
  setOldPassword(String oldPassword) {
    _oldPassword = oldPassword;
  }

  String _newPassowrd = '';
  String get newPassowrd => _newPassowrd;
  setnewPassowrd(String newPassowrd) {
    _newPassowrd = newPassowrd;
  }

  Future<Map<String, dynamic>> changePassword() async {
    try {
      setChangePasswordLoading(true);
      final data = {
        "currentPassword": oldPassword,
        "newPassword": newPassowrd,
      };
      final token = await getToken();
      log('Change Password Token: $token');
      final response =
          await changePasswordRepository.changePassword(data, token);
      log("Change Password Response: $response");
      setChangePasswordLoading(false);
      return response;
    } catch (e) {
      setChangePasswordLoading(false);
      log("Change Password Error: $e");
      throw Exception(e.toString());
    } finally {
      setChangePasswordLoading(false);
    }
  }
}
