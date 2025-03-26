import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/model/rides/booking_request/confirm_booking_model.dart';
import 'package:quick_hitch/repository/ride_repository/bookings/confirm_booking_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class ConfirmBookingViewModel with ChangeNotifier {
  ConfirmBookingModel? _confirmBookingModel;
  ConfirmBookingModel? get recentSearch => _confirmBookingModel;

  bool _getConfrimBookingLoading = false;
  bool get getConfrimBookingLoading => _getConfrimBookingLoading;

  setConfrimBookingLoading(bool value) {
    _getConfrimBookingLoading = value;
    notifyListeners();
  }

  Future<void> confirmBooking(String bookingId) async {
    try {
      setConfrimBookingLoading(true);
      String token = await getToken();
      var data = {
        'bookingId': bookingId,
      };
      final confirmBookingData =
          await ConfirmBookingRepository().confirmBooking(data, token);
      _confirmBookingModel = confirmBookingData;
    } catch (e) {
      log("Confirm Booking rides: $e");
    } finally {
      setConfrimBookingLoading(false);
      notifyListeners();
    }
  }
}
