import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/model/vehicles/vehicle_model.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/find_one_vehicle_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class FindOneVehicleViewModel with ChangeNotifier {
  VehicleModel? _vehicle;
  VehicleModel? get vehicle => _vehicle;

  bool _findOneVehicleLoading = false;
  bool get findOneVehicleLoading => _findOneVehicleLoading;

  setfindOneVehicleLoading(bool value) {
    _findOneVehicleLoading = value;
    // notifyListeners();
  }

  Future<void> findOneVehicle(String id) async {
    try {
      setfindOneVehicleLoading(true);

      String token = await getToken();

      _vehicle = await FindOneVehicleRepository().findOneVehicle(id, token);
      log("Fetched Vehicle: $_vehicle");
      if (_vehicle == null) {
        log("⚠️ Warning: No vehicle data returned from API!");
      } else {
        log("✅ Vehicle data fetched: ${_vehicle!.toJson()}");
      }
      setfindOneVehicleLoading(false);
    } catch (e) {
      setfindOneVehicleLoading(false);
      log("Error fetching vehicle: $e");
    } finally {
      setfindOneVehicleLoading(false);
      notifyListeners();
    }
  }
}
