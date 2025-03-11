import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/vehicles/vehicle_model.dart';

class FindOneVehicleRepository with ChangeNotifier {
  Future<VehicleModel?> findOneVehicle(String id, String token) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse('${AppUrl.findOneVehicleEndPoint}$id');

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
        if (response.body.isEmpty || response.body == 'null') {
          log("⚠️ Warning: API returned empty response!");
          return null;
        }
        final responseData = oneVehicleModelFromJson(response.body);
        log("✅ Parsed Vehicle Data: ${responseData.toJson()}");
        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "find one vehicle failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("find vehicle Error: $e");
      throw Exception(e.toString());
    }
  }
}
