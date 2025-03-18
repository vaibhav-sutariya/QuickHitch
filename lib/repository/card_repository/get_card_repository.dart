import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_hitch/configs/app_url.dart';
import 'package:quick_hitch/model/home/card_model.dart';

class GetCardRepository with ChangeNotifier {
  Future<CardModel> getCards(String token) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }
      log("Get cards Token: $token");

      final url = Uri.parse(AppUrl.getAllCardsEndPoint);

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
        log("Get Card Response: $responseData");
        return CardModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Get card failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Get Cards Error: $e");
      throw Exception(e.toString());
    }
  }

  Future<CardModel> setDefaultCard(dynamic data, String token) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }
      log("Get cards Token: $token");

      final url = Uri.parse(AppUrl.setDefaultCardEndPoint);

      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data),
      );
      log("Response Status Code: '${response.statusCode}'");
      log("Response Body: '${response.body}'");
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        log("Set default Card Response: $responseData");
        return CardModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Set default card failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Set default card Error: $e");
      throw Exception(e.toString());
    }
  }

  Future<CardModel> deleteCard(String id, String token) async {
    try {
      if (token.isEmpty) {
        throw Exception("Token is empty or null");
      }
      log("Get cards Token: $token");

      final url = Uri.parse('${AppUrl.addCardEndPoint}/$id/delete');

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
        log("Delete Card Response: $responseData");
        return CardModel.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Delete card failed: ${errorData['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      log("Delete card Error: $e");
      throw Exception(e.toString());
    }
  }
}
