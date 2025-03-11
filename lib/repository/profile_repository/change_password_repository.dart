import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart' show AppUrl;

class ChangePasswordRepository with ChangeNotifier {
  Future<Map<String, dynamic>> changePassword(
    dynamic data,
    String token,
  ) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse(AppUrl.changePasswordApiEndPoint);

      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data),
      );

      log("Response Status Code: '${response.statusCode}'");
      log("Response Body: '${response.body}'");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        log("Change Password Success Response: $responseData");
        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Change Password failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Change Password Error: $e");
      throw Exception(e.toString());
    }
  }
}
