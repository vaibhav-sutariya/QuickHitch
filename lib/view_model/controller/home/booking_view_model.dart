import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/repository/booking_repository/create_booking_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class BookingViewModel with ChangeNotifier {
  bool _isSwitched = false;

  bool get isSwitched => _isSwitched;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }

  int _counter = 1;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 1) {
      _counter--;
      notifyListeners();
    }
  }

  // Getter and setter for email
  String _promoCode = '';
  String get promoCode => _promoCode;
  setPromocode(String promoCode) {
    _promoCode = promoCode;
  }

  String error = '';
  String get getError => error;
  set setError(String value) => error = value;

  void applyPromoCode(BuildContext context) {
    if (promoCode.isNotEmpty) {
      if (promoCode == 'DISCOUNT') {
        Utils.flushBarSuccessMessage('Promocode Applied Successfully', context);
        clearError();
        notifyListeners();
      } else {
        setError = 'This promo code is invalid, please try again.';
      }
      notifyListeners();
    } else {
      setError = 'Please enter a valid promo code';
      notifyListeners();
    }
  }

  void clearError() {
    setError = '';
    notifyListeners();
  }

  Future<void> createBookings(BuildContext context, String stopId) async {
    try {
      String token = await getToken();

      var data = {
        "stopId": stopId,
        "noOfSeats": counter,
      };

      final response =
          await CreateBookingRepository().createBooking(data, token);

      if (response['status'] == 201 ||
          response['message'] == "Booking created successfully") {
        log("Booking Successfully: $response");
        Utils.flushBarSuccessMessage('Booking created Successfully', context);

        await Future.delayed(Duration(seconds: 1));

        // ✅ Navigate and do not return response after this point
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.bookingRequestScreen, (route) => false);
      } else {
        log("Booking Error: $response");
        Utils.flushBarErrorMessage('Booking Failed', context);
      }
    } catch (e) {
      log("Booking Error: $e");
      Utils.flushBarErrorMessage("Booking failed: $e", context);
    }
  }
}
