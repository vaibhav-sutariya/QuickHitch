import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/bookings/booking_details_model.dart';

class GetBookingDetailsRepository with ChangeNotifier {
  Future<BookingDetailsModel> getBookingDetails(String id, String token) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }
      log("Get Booking Details Token: $token");

      final url = Uri.parse('${AppUrl.getBookingDetailsEndPoint}/$id');

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
        log("Get Booking Details Response: $responseData");
        return BookingDetailsModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Get Booking Details failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Get Booking Details Error: $e");
      throw Exception(e.toString());
    }
  }
}
