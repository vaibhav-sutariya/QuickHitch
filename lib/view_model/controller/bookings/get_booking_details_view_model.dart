import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/model/bookings/booking_details_model.dart';
import 'package:quick_hitch/repository/booking_repository/get_booking_details_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class GetBookingDetailsViewModel with ChangeNotifier {
  BookingDetailsModel? _bookingDetailsModel;
  BookingDetailsModel? get bookingDetailsModel => _bookingDetailsModel;

  bool _getBookingDetailsModelLoading = false;
  bool get getBookingDetailsModelLoadingLoading =>
      _getBookingDetailsModelLoading;

  setBookingDetailsModelLoading(bool value) {
    _getBookingDetailsModelLoading = value;
    notifyListeners();
  }

  Future<void> getBookingDetails(String id) async {
    try {
      setBookingDetailsModelLoading(true);
      String token = await getToken();

      final bookingDetails =
          await GetBookingDetailsRepository().getBookingDetails(id, token);
      _bookingDetailsModel = bookingDetails;
    } catch (e) {
      log("Error get booking details: $e");
    } finally {
      setBookingDetailsModelLoading(false);
      notifyListeners();
    }
  }
}
