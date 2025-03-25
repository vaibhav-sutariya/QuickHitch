import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/bookings/refund_model.dart';

class CancelBookingRepository with ChangeNotifier {
  Future<RefundModel> cancelBooking(
    dynamic data,
    String token,
  ) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse(AppUrl.cancelBookingEndPoint);

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
        log("Cancel booking Response: $responseData");
        return RefundModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "cancel booking failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Confirm Booking Error: $e");
      throw Exception(e.toString());
    }
  }
}
