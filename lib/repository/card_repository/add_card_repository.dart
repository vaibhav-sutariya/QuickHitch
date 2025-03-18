import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:quick_hitch/configs/app_url.dart';

class AddCardRepository with ChangeNotifier {
  Future<Map<String, dynamic>> addCard(dynamic cardToken, String token) async {
    final response = await post(
      Uri.parse(AppUrl.addCardEndPoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(cardToken),
    );
    log("Add Card Response Code: ${response.statusCode}");
    log("Add Card Response: ${response.body}");

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log("Add Card  Response: $responseData");
      return responseData;
    } else {
      throw Exception("Add Card failed: ${response.body}");
    }
  }
}
