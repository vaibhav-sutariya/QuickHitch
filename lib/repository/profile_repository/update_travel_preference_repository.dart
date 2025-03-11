import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';

class UpdateTravelPreferenceRepository with ChangeNotifier {
  Future<Map<String, dynamic>> updateTravelPreferences(
    dynamic data,
    String token,
  ) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse(AppUrl.travelPreferencesEndPoint);

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
        log("Update Travel pref Success Response: $responseData");
        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Update Travel pref failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Change Password Error: $e");
      throw Exception(e.toString());
    }
  }
}
