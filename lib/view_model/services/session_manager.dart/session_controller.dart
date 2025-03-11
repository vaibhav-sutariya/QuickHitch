import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/model/user/user_profile_model.dart';

import '../storage/local_storage.dart';

// Singleton Class
class SessionController {
  static final SessionController _session = SessionController._internal();
  factory SessionController() => _session;

  LocalStorage sharedPreferenceClass = LocalStorage();
  bool isLogin = false;
  UserProfileModel? user;

  SessionController._internal(); // Private constructor

  // Saving user data into SharedPreferences
  Future<void> saveUserInPreference(dynamic id, dynamic token) async {
    await sharedPreferenceClass.setValue('userId', id);
    await sharedPreferenceClass.setValue('token', token);
    await sharedPreferenceClass.setValue(
        'isLogin', 'true'); // Ensure it's stored as 'true'
    isLogin = true; // Update local variable
  }

  // Getting User Data from SharedPreferences
  Future<void> getUserFromPreference() async {
    try {
      var userDataString = await sharedPreferenceClass.readValue('userId');
      var tokenString = await sharedPreferenceClass.readValue('token');
      var isLoginPref =
          await sharedPreferenceClass.readValue('isLogin') ?? 'false';

      log('User Data (String): $userDataString');
      log('Token (String): $tokenString');
      log('isLogin: $isLoginPref');

      if (userDataString != null && userDataString.isNotEmpty) {
        // Ensure it's a valid JSON string before decoding
        try {
          var userDataMap = jsonDecode(userDataString);
          user = userProfileModelFromJson(userDataMap);
        } catch (e) {
          log("Error decoding user data: $e");
        }
      }

      isLogin = isLoginPref == 'true'; // Convert to boolean
    } catch (e) {
      debugPrint("Error fetching user session: ${e.toString()}");
    }
  }

  // Clear Session
  Future<void> clearSession() async {
    await sharedPreferenceClass.clearValue('userId');
    // await sharedPreferenceClass.clearValue('token');
    await sharedPreferenceClass.clearValue('isLogin');
    isLogin = false;
  }
}
