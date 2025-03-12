import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';

class SearchFilterRepository with ChangeNotifier {
  Future<RideModel> searchAndFilterRide(
      String token,
      String origin,
      String originLat,
      String originLong,
      String destination,
      String destinationLat,
      String destinationLong,
      int emptySeats) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }
      log("Search and filter rides Token: $token");

      final url = Uri.parse(
          '${AppUrl.searchAndFileterEndPoint}origin=$origin&originLat=$originLat&originLong=$originLong&destination=$destination&destinationLat=$destinationLat&destinationLong=$destinationLong&minEmptySeats=$emptySeats&status=REQUESTED');

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
        log("Search and filter Response: $responseData");
        return RideModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Search and filter failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Search and filter Error: $e");
      throw Exception(e.toString());
    }
  }
}
