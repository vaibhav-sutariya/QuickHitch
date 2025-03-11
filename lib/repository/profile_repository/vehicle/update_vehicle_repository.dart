import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';

class UpdateVehicleRepository with ChangeNotifier {
  Future<Map<String, dynamic>> updateVehicle(
    String id,
    Map<String, dynamic> data,
    String token,
    File? profileImage,
  ) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }

      final url = Uri.parse('${AppUrl.updateVehiclesEndPoint}$id');
      var request = http.MultipartRequest("PATCH", url);

      // Add headers
      request.headers['Authorization'] = 'Bearer $token';

      // Add text fields
      data.forEach((key, value) {
        if (value != null) {
          request.fields[key] = value.toString();
        }
      });

      // Add image if present
      if (profileImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath('photo', profileImage.path),
        );
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        log("Update vehicle Success Response: $responseData");
        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Update vehicle failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Update vehicle Error: $e");
      throw Exception(e.toString());
    }
  }
}
