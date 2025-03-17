import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class AddNewCardViewModel with ChangeNotifier {
  String _cardNumber = "";
  String get cardNumber => _cardNumber;

  set cardNumber(String value) {
    _cardNumber = value;
    notifyListeners();
  }

  String cardType = "Unknown";

  void onCardNumberChanged(String value) {
    String formatted = _formatCardNumber(value);
    cardNumber = formatted;

    cardType = _detectCardType(value);
    log('Card Type: $cardType');
    log('Card Number: $cardNumber');
    notifyListeners();
  }

  String _formatCardNumber(String input) {
    String cleaned = input.replaceAll(RegExp(r'\D'), '');
    String formatted = '';

    for (int i = 0; i < cleaned.length; i++) {
      if (i > 0 && i % 4 == 0) formatted += ' ';
      formatted += cleaned[i];
    }
    return formatted;
  }

  String _detectCardType(String number) {
    if (number.startsWith(RegExp(r'^4'))) return "Visa";
    if (number.startsWith(RegExp(r'^(5[1-5])'))) return "MasterCard";
    if (number.startsWith(RegExp(r'^3[47]'))) return "American Express";
    if (number.startsWith(RegExp(r'^6'))) return "Discover";
    return "Unknown";
  }

  bool isValidCardNumber(String number) {
    String cleaned = number.replaceAll(RegExp(r'\D'), '');
    int sum = 0;
    bool alternate = false;

    for (int i = cleaned.length - 1; i >= 0; i--) {
      int digit = int.parse(cleaned[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }

      sum += digit;
      alternate = !alternate;
    }

    return (sum % 10 == 0);
  }

  String _cvv = "";
  String get cvv => _cvv;

  set cvv(String value) {
    if (value.length <= 4) {
      _cvv = value;
      log('CVV: $_cvv');
      notifyListeners();
    }
  }

  String? _postalCode;
  String get postalCode => _postalCode!;

  set postalCode(String value) {
    _postalCode = value;
    log('Postal Code: $_postalCode');
    notifyListeners();
  }

  String? _cardHolderName;
  String get cardHolderName => _cardHolderName!;

  set cardHolderName(String value) {
    _cardHolderName = value;
    log('Card Holder Name: $_cardHolderName');
    notifyListeners();
  }

  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;

  Future<void> selectExpiryDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 10),
    );

    if (picked != null) {
      _expiryDate = picked;
      notifyListeners();
    }
  }

  /// Get Stripe Token for Card
  /// Get Stripe Token for Card
  Future<String?> getStripeToken() async {
    try {
      // Validate required fields
      if (_cardNumber.isEmpty ||
          _expiryDate == null ||
          _cvv.isEmpty ||
          _cardHolderName == null) {
        log("Card details incomplete");
        return null;
      }

      // Clean card number
      final cleanCardNumber = cardNumber.replaceAll(' ', '');
      final tokenData = await Stripe.instance.createToken(
        CreateTokenParams.card(params: CardTokenParams()),
      );

      log('Stripe Token: ${tokenData.id}');
      return tokenData.id;
    } catch (e) {
      log("Error getting Stripe token: $e");
      return null;
    }
  }

  /// Send Token to Backend API
  // Future<void> _addCardToBackend(String cardToken) async {
  //   const String apiUrl = "YOUR_API_BASE_URL/user/card";
  //   try {
  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer YOUR_BACKEND_API_KEY"
  //       },
  //       body: jsonEncode({"cardToken": cardToken}),
  //     );

  //     if (response.statusCode == 200) {
  //       log('Card added successfully: ${response.body}');
  //     } else {
  //       log('Failed to add card: ${response.body}');
  //     }
  //   } catch (e) {
  //     log('Error sending card to backend: $e');
  //   }
  // }
}
