import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';

class DeleteVehicleRepository with ChangeNotifier {
  Future<Map<String, dynamic>> deleteVehicle(
    String id,
    String token,
  ) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse(AppUrl.deleteVehiclesEndPoint + id);
      log("Delete Vehicle URL: $url");

      final response = await http.delete(
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
        log("vehicle delete Success Response: $responseData");
        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "vehicle delete failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("vehicle delete Error: $e");
      throw Exception(e.toString());
    }
  }
}
