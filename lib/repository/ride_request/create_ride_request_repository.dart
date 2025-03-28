import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:quick_hitch/configs/app_url.dart';

class CreateRideRequestRepository with ChangeNotifier {
  Future<Map<String, dynamic>> createRideRequest(
      dynamic data, String token) async {
    final response = await post(
      Uri.parse(AppUrl.createRideRequestEndPoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );
    log("Create ride request Response Code: ${response.statusCode}");
    log("Create ride request Response: ${response.body}");

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Create ride request  Response: $responseData");
      return responseData;
    } else {
      throw Exception("Create ride request failed: ${response.body}");
    }
  }
}
