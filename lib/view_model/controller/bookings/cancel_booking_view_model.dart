import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/bookings/refund_model.dart';
import 'package:quick_hitch/repository/booking_repository/cancel_booking_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class CancelBookingViewModel with ChangeNotifier {
  RefundModel? _refundDetailsModel;
  RefundModel? get refundDetailsModel => _refundDetailsModel;

  bool _updateCancelBookingLoading = false;
  bool get updateCancelBookingLoading => _updateCancelBookingLoading;

  setCancelBookingLoading(bool value) {
    _updateCancelBookingLoading = value;
    notifyListeners();
  }

  Future<void> cancelBooking(BuildContext context, String bookingId) async {
    final token = await getToken();
    log('Token: $token');
    try {
      setCancelBookingLoading(true);
      var data = {
        'bookingId': bookingId,
      };
      final response =
          await CancelBookingRepository().cancelBooking(data, token);
      log('Confirm Booking Response: $response');
      _refundDetailsModel = response;
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(
        context,
        RoutesName.refundDetailsScreen,
        arguments: bookingId,
      );
      setCancelBookingLoading(false);
    } catch (e) {
      setCancelBookingLoading(false);
      log('Confirm Booking Error: $e');
      throw Exception(e.toString());
    } finally {
      setCancelBookingLoading(false);
    }
  }
}
