import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/vehicles/make_model.dart'; // Import your model

class MakeRepository with ChangeNotifier {
  Future<List<MakeModel>> getMakes(String token) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.makeEndPoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> makesList = json.decode(response.body)['makes'];
        List<MakeModel> makes =
            makesList.map((e) => MakeModel.fromJson(e)).toList();
        log('Makes List: $makes');
        return makes;
      } else {
        throw Exception("Failed to load makes: ${response.statusCode}");
      }
    } catch (e) {
      log('Error fetching makes: $e');
      throw Exception("Error fetching makes");
    }
  }
}
