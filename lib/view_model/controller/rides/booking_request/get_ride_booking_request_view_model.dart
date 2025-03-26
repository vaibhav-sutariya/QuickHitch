import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/model/rides/booking_request/get_booking_request_model.dart';
import 'package:quick_hitch/repository/ride_repository/bookings/get_booking_request_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';
import 'package:quick_hitch/view_model/services/ride_toggle/three_ride_toggle_provider.dart';

class GetRideBookingRequestViewModel with ChangeNotifier {
  GetBookingRequestModel? _bookingRequestModel;
  GetBookingRequestModel? get bookingRequestModel => _bookingRequestModel;

  bool _getBookingRequestLoading = false;
  bool get getBookingRequestLoading => _getBookingRequestLoading;

  String? _currentRideId;

  void setBookingRequestLoading(bool value) {
    _getBookingRequestLoading = value;
    notifyListeners();
  }

  Future<void> getRidesBookingReq(String id, {String? status}) async {
    try {
      setBookingRequestLoading(true);

      _currentRideId = id;

      String token = await getToken();

      final rideStatus = status ??
          ThreeRideBookingReqToggleProvider().selectedStatus.name.toUpperCase();

      log("Fetching booking requests with Status: $rideStatus");

      final rides = await GetBookingRequestRepository()
          .getBookingRequests(id, token, rideStatus);

      _bookingRequestModel = rides;
    } catch (e) {
      log("Error fetching booking requests: $e");
      _bookingRequestModel = null;
    } finally {
      setBookingRequestLoading(false);
      notifyListeners();
    }
  }

  // Method to refresh with the current ride ID and selected status
  void refreshBookingRequests(RidebookingStatus status) {
    if (_currentRideId != null) {
      getRidesBookingReq(_currentRideId!, status: status.name.toUpperCase());
    }
  }
}
