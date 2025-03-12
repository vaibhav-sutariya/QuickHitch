import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/home/recent_search_model.dart';

class RecentSearchRepository with ChangeNotifier {
  Future<RecentSearchModel> recentSearch(String token) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }
      log("Recent Search Token: $token");

      final url = Uri.parse(AppUrl.recentSearchEndPoint);

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
        log("Recent Search Response: $responseData");
        return RecentSearchModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Recent Search failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Recent Search Error: $e");
      throw Exception(e.toString());
    }
  }
}
