import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/user/user_profile_model.dart';

class AuthRepository {
  Future<Map<String, dynamic>> loginApi(dynamic data) async {
    try {
      final url = Uri.parse(AppUrl.loginApiEndPoint);

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      log("Response Status Code: '${response.statusCode}'");
      log("Response Body: '${response.body}'");
      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        log("Login Response: $responseData");

        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "get User profile failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Login Error: $e");
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> registerApi(dynamic data) async {
    final response =
        await post(Uri.parse(AppUrl.registerApiEndPoint), body: data);

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Register Response: $responseData");
      return responseData;
    } else {
      throw Exception("Register failed: ${response.body}");
    }
  }

  Future<Map<String, dynamic>> forgotPasswordApi(dynamic data) async {
    final response =
        await post(Uri.parse(AppUrl.forgotPasswordApiEndPoint), body: data);

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Forgot Password Response: $responseData");
      return responseData;
    } else {
      throw Exception("Forgot Password failed: ${response.body}");
    }
  }

  Future<Map<String, dynamic>> verifyEmailApi(String token) async {
    final response = await get(Uri.parse(AppUrl.verifyEmailEndPoint + token));

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Verify Email Response: $responseData");
      return responseData;
    } else {
      throw Exception("Verify Email failed: ${response.body}");
    }
  }

  Future<Map<String, dynamic>> googleSigninApi(String idToken) async {
    final response = await post(
      Uri.parse(AppUrl.googleSigninEndPoint),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({"idToken": idToken}),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Google Signin Response: $responseData");
      return responseData;
    } else {
      throw Exception("Google Signin failed: ${response.body}");
    }
  }

  Future<UserProfileModel> facebookSigninApi(String idToken) async {
    final response = await post(
      Uri.parse(AppUrl.facebookSigninEndPoint),
      body: jsonEncode({"idToken": idToken}),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Facebook Signin Response: $responseData");
      return responseData;
    } else {
      throw Exception("Facebook Signin failed: ${response.body}");
    }
  }

  Future<Map<String, dynamic>> appleSigninApi() async {
    final response = await post(
      Uri.parse(AppUrl.appleSigninEndPoint),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Apple Signin Response: $responseData");
      return responseData;
    } else {
      throw Exception("Apple Signin failed: ${response.body}");
    }
  }
}
