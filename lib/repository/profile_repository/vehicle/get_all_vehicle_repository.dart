import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/vehicles/vehicle_model.dart';

class GetAllVehicleRepository with ChangeNotifier {
  Future<List<VehicleModel>> getAllVehicles(String token) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse(AppUrl.getVehiclesEndPoint);

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
        final responseData = vehicleModelFromJson(response.body);
        log("Get all Vehicles Response: $responseData");
        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "get all vehicle failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("get all vehicle Error: $e");
      throw Exception(e.toString());
    }
  }
}
