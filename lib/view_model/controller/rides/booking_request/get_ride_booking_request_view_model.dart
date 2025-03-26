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

  String? currentRideId;

  // Injecting dependency for toggle provider to maintain a single instance
  final ThreeRideBookingReqToggleProvider _toggleProvider;

  GetRideBookingRequestViewModel(this._toggleProvider);

  void setBookingRequestLoading(bool value) {
    if (_getBookingRequestLoading != value) {
      _getBookingRequestLoading = value;
      notifyListeners();
    }
  }

  Future<void> getRidesBookingReq(String id, {String? status}) async {
    try {
      setBookingRequestLoading(true);

      currentRideId = id;

      String token = await getToken();

      final rideStatus =
          status ?? _toggleProvider.selectedStatus.name.toUpperCase();

      log("Fetching booking requests with Status: $rideStatus");

      final rides = await GetBookingRequestRepository()
          .getBookingRequests(id, token, rideStatus);

      _bookingRequestModel = rides;
    } catch (e, stacktrace) {
      log("Error fetching booking requests: $e");
      log("Stacktrace: $stacktrace");
    } finally {
      setBookingRequestLoading(false);
    }
  }

  // Method to refresh with the current ride ID and selected status
  void refreshBookingRequests(RidebookingStatus status) {
    if (currentRideId != null) {
      getRidesBookingReq(currentRideId!, status: status.name.toUpperCase());
    }
  }
}
