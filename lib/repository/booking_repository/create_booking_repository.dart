import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:quick_hitch/configs/app_url.dart';

class CreateBookingRepository with ChangeNotifier {
  Future<Map<String, dynamic>> createBooking(dynamic data, String token) async {
    final response = await post(
      Uri.parse(AppUrl.createBookingEndPoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );
    log("Create booking Response Code: ${response.statusCode}");
    log("Create booking Response: ${response.body}");

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Create booking Response: $responseData");
      return responseData;
    } else {
      throw Exception("Create booking failed: ${response.body}");
    }
  }
}
