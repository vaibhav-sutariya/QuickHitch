import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
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

  bool _getRejectBookingLoading = false;
  bool get getRejectBookingLoading => _getRejectBookingLoading;

  setRejectBookingLoading(bool value) {
    _getRejectBookingLoading = value;
    notifyListeners();
  }

  Future<void> confirmBooking(String bookingId, BuildContext context) async {
    try {
      setConfrimBookingLoading(true);
      String token = await getToken();
      var data = {
        'bookingId': bookingId,
      };
      final confirmBookingData = await ConfirmBookingRepository()
          .confirmBooking(data, token)
          .then((value) async {
        await Future.delayed(Duration(seconds: 1));
        Navigator.pushNamed(
          context,
          RoutesName.approvedBookingDetailsScreen,
          arguments: _confirmBookingModel!.data,
        );
      });

      _confirmBookingModel = confirmBookingData;
    } catch (e) {
      log("Confirm Booking rides: $e");
    } finally {
      setConfrimBookingLoading(false);
      notifyListeners();
    }
  }

  Future<void> rejectBooking(String bookingId, BuildContext context) async {
    try {
      setRejectBookingLoading(true);
      String token = await getToken();
      var data = {
        'bookingId': bookingId,
      };
      final confirmBookingData =
          await ConfirmBookingRepository().rejectBooking(data, token);
      _confirmBookingModel = confirmBookingData;
      await Future.delayed(Duration(seconds: 1));
      Navigator.pop(context);
    } catch (e) {
      log("Reject Booking rides: $e");
    } finally {
      setRejectBookingLoading(false);
      notifyListeners();
    }
  }
}
