import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:quick_hitch/model/ride_request/get_ride_request_details_model.dart';
import 'package:quick_hitch/repository/ride_request/get_ride_request_details_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class GetRideRequestDetailsViewModel with ChangeNotifier {
  GetRideRequestDetailsModel? _rideRequestDetails;
  GetRideRequestDetailsModel? get rideRequestDetails => _rideRequestDetails;

  bool _getRideRequestDetailsLoading = false;
  bool get getRideRequestDetailsLoading => _getRideRequestDetailsLoading;

  setgetRideRequestDetailsLoading(bool value) {
    _getRideRequestDetailsLoading = value;
    notifyListeners();
  }

  Future<void> getRideRequestDetails(String id) async {
    try {
      setgetRideRequestDetailsLoading(true);

      String token = await getToken();

      final rideRequestDetails = await GetRideRequestDetailsRepository()
          .getRideRequestDetails(id, token);
      _rideRequestDetails = rideRequestDetails;
    } catch (e) {
      log("Error fetching rides: $e");
    } finally {
      setgetRideRequestDetailsLoading(false);
      notifyListeners();
    }
  }
}
