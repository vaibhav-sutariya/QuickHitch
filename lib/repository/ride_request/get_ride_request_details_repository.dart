import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/ride_request/get_ride_request_details_model.dart';

class GetRideRequestDetailsRepository with ChangeNotifier {
  Future<GetRideRequestDetailsModel> getRideRequestDetails(
      String id, String token) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }
      log("Get Rides Token: $token");

      final url = Uri.parse('${AppUrl.rideRequestDetailsEndPoint}$id/details');

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
        log("Get Ride request details Response: $responseData");
        // Here's the issue - you're returning Map<String, dynamic> instead of RideModel
        return GetRideRequestDetailsModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "get Ride request details failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("get Ride request details Error: $e");
      throw Exception(e.toString());
    }
  }
}
