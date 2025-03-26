import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/rides/cancel_ride_model.dart';
import 'package:quick_hitch/repository/ride_repository/cancel_ride_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class CancelRideViewModel with ChangeNotifier {
  CancelRideModel? _cancelRideModel;
  CancelRideModel? get refundDetailsModel => _cancelRideModel;

  bool _updateCancelrideLoading = false;
  bool get updateCancelrideLoading => _updateCancelrideLoading;

  setCancelrideLoading(bool value) {
    _updateCancelrideLoading = value;
    notifyListeners();
  }

  Future<void> cancelRide(BuildContext context, String id) async {
    final token = await getToken();
    log('Token: $token');
    try {
      setCancelrideLoading(true);

      final response = await CancelRideRepository().cancelBooking(id, token);
      log('Confirm Booking Response: $response');
      _cancelRideModel = CancelRideModel.fromJson(response.toJson());
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(
        context,
        RoutesName.bottomNavBar,
      );
      setCancelrideLoading(false);
    } catch (e) {
      setCancelrideLoading(false);
      log('Confirm Booking Error: $e');
      throw Exception(e.toString());
    } finally {
      setCancelrideLoading(false);
    }
  }
}
