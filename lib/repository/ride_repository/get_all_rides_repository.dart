import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';

class GetAllRidesRepository with ChangeNotifier {
  Future<RideModel> getRides(String token, String status) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }
      log("Get Rides Token: $token");
      log("Get Rides Status: $status");

      final url = Uri.parse('${AppUrl.getRidesEndPoint}$status');

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
        log("Get Rides Response: $responseData");
        // Here's the issue - you're returning Map<String, dynamic> instead of RideModel
        return RideModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "get Rides failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("get Rides Error: $e");
      throw Exception(e.toString());
    }
  }
}
