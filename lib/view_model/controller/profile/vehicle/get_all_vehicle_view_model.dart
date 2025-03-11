import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/model/vehicles/vehicle_model.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/get_all_vehicle_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class GetAllVehicleViewModel with ChangeNotifier {
  List<VehicleModel> _vehicles = [];
  List<VehicleModel> get vehicles => _vehicles;

  bool _getAllVehicleLoading = false;
  bool get getAllVehicleLoading => _getAllVehicleLoading;

  setgetAllVehicleLoading(bool value) {
    _getAllVehicleLoading = value;
    // notifyListeners();
  }

  Future<void> getAllVehicles() async {
    try {
      setgetAllVehicleLoading(true);

      String token = await getToken();

      _vehicles = await GetAllVehicleRepository().getAllVehicles(token);
      log("Fetched Vehicles: $_vehicles");
      setgetAllVehicleLoading(false);
    } catch (e) {
      setgetAllVehicleLoading(false);
      log("Error fetching vehicles: $e");
    } finally {
      setgetAllVehicleLoading(false);
      notifyListeners();
    }
  }
}
