import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/delete_vehicle_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class DeleteVehicleViewModel with ChangeNotifier {
  bool _deleteVehicleLoading = false;
  bool get deleteVehicleLoading => _deleteVehicleLoading;

  setdeleteVehicleLoading(bool value) {
    _deleteVehicleLoading = value;
    notifyListeners();
  }

  Future<void> deleteVehicle(String id) async {
    try {
      setdeleteVehicleLoading(true);
      notifyListeners();

      // Replace with actual user ID and token
      String token = await getToken();

      await DeleteVehicleRepository().deleteVehicle(id, token);
      log('Vehicle deleted successfully');
      setdeleteVehicleLoading(false);
    } catch (e) {
      setdeleteVehicleLoading(false);
      log("Error deleting vehicle : $e");
    } finally {
      setdeleteVehicleLoading(false);
      notifyListeners();
    }
  }
}
