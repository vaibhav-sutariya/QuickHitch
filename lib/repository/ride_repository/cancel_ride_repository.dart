import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/rides/cancel_ride_model.dart';

class CancelRideRepository with ChangeNotifier {
  Future<CancelRide> cancelBooking(
    String id,
    String token,
  ) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse('${AppUrl.cancelRideEndPoint}$id/cancel');

      final response = await http.patch(
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
        log("Cancel ride Response: $responseData");
        return CancelRide.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "cancel ride failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Confirm ride Error: $e");
      throw Exception(e.toString());
    }
  }
}
