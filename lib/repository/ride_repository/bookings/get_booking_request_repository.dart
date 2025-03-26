import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/rides/booking_request/get_booking_request_model.dart';

class GetBookingRequestRepository with ChangeNotifier {
  Future<GetBookingRequestModel> getBookingRequests(
      String id, String token, String status) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }
      log("list ride booking req Token: $token");
      log("list ride booking req Status: $status");

      final url = Uri.parse(
          '${AppUrl.listRideBookingRequestEndPoint}$id/booking/request?status=$status');

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
        final responseData = jsonDecode(response.body);
        log("list ride booking req  Response: $responseData");
        return GetBookingRequestModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "list ride booking req failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("list ride booking req Error: $e");
      throw Exception(e.toString());
    }
  }
}
