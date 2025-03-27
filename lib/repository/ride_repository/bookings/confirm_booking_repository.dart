import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/rides/booking_request/confirm_booking_model.dart';

class ConfirmBookingRepository with ChangeNotifier {
  Future<ConfirmBookingModel> confirmBooking(
    dynamic data,
    String token,
  ) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse(AppUrl.rideBookingConfirmEndPoint);

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
        log("Confirm Booking Success Response: $responseData");
        return ConfirmBookingModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Confirm Booking failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Confirm Booking Error: $e");
      throw Exception(e.toString());
    }
  }

  Future<ConfirmBookingModel> rejectBooking(
    dynamic data,
    String token,
  ) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse(AppUrl.rideBookingRejectEndPoint);

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
        log("Reject Booking Success Response: $responseData");
        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Reject Booking failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Reject Booking Error: $e");
      throw Exception(e.toString());
    }
  }
}
