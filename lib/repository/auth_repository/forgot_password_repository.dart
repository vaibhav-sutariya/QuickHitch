import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:quick_hitch/configs/app_url.dart';

class ForgotPasswordRepository with ChangeNotifier {
  Future<Map<String, dynamic>> forgotPasswordApi(
      dynamic data, String token) async {
    final response = await post(
      Uri.parse(AppUrl.forgotPasswordApiEndPoint),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Forgot Password Response: $responseData");
      return responseData;
    } else {
      throw Exception("Forgot Password failed: ${response.body}");
    }
  }
}
