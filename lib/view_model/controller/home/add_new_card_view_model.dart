import 'dart:developer';

import 'package:flutter/material.dart';

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

  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;

  Future<void> selectExpiryDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 10),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            hintColor: Colors.blueAccent,
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      _expiryDate = picked;
      log('Expiry Date: ${picked.month}/${picked.year}');
      notifyListeners();
    }
  }

  String _cvv = ""; // Default to an empty string to prevent null errors.
  String get cvv => _cvv;

  set cvv(String value) {
    if (value.length <= 3) {
      // CVV should be at most 3 digits
      _cvv = value;
      log('CVV: $_cvv');
      notifyListeners();
    }
  }

  /// Validates CVV (3-digit for most cards, 4-digit for AMEX)
  bool isValidCVV(String cvv, {bool isAmex = false}) {
    return isAmex ? cvv.length == 4 : cvv.length == 3;
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
}
