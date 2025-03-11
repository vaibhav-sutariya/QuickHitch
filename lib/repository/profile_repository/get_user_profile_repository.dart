import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/user/user_profile_model.dart';

class GetUserProfileRepository with ChangeNotifier {
  Future<UserProfileModel> getUserProfile(String id, String token) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse('${AppUrl.getUserProfileEndPoint}$id');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      log("Response Status Code: '${response.statusCode}'");
      log("Response Body: '${response.body}'");

      if (response.statusCode == 200) {
        final responseData = userProfileModelFromJson(response.body);
        log("Get User Success profile Response: $responseData");
        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "get User profile failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("get User profile Error: $e");
      throw Exception(e.toString());
    }
  }
}
