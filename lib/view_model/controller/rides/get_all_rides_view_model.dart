import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';
import 'package:quick_hitch/repository/ride_repository/get_all_rides_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';
import 'package:quick_hitch/view_model/services/ride_toggle/three_ride_toggle_provider.dart';

class GetAllRidesViewModel with ChangeNotifier {
  RideModel? _rides;
  RideModel? get rides => _rides;

  bool _getRidesLoading = false;
  bool get getRidesLoading => _getRidesLoading;

  setgetRidesLoading(bool value) {
    _getRidesLoading = value;
    notifyListeners();
  }

  Future<void> getRides() async {
    try {
      setgetRidesLoading(true);

      String token = await getToken();
      // This needs to be initialized first
      ThreeRideToggleProvider threeRideToggleProvider =
          ThreeRideToggleProvider();
      final rideStatus =
          threeRideToggleProvider.selectedStatus.name.toString().toUpperCase();
      log("Status: $rideStatus");

      final rides = await GetAllRidesRepository().getRides(token, rideStatus);
      _rides = rides;
    } catch (e) {
      log("Error fetching rides: $e");
    } finally {
      setgetRidesLoading(false);
      notifyListeners();
    }
  }
}
