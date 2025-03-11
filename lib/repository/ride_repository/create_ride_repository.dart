import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:quick_hitch/configs/app_url.dart';

class CreateRideRepository with ChangeNotifier {
  Future<Map<String, dynamic>> createRide(dynamic data, String token) async {
    final response = await post(
      Uri.parse(AppUrl.createRideEndPoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );
    log("Ride Create Response Code: ${response.statusCode}");
    log("Ride Create Response: ${response.body}");

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Ride Create  Response: $responseData");
      return responseData;
    } else {
      throw Exception("Ride Create failed: ${response.body}");
    }
  }
}
