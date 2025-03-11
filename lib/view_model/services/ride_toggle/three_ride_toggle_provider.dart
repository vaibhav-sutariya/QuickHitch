import 'package:flutter/material.dart';

enum RideStatus { active, completed, cancelled }

class ThreeRideToggleProvider with ChangeNotifier {
  RideStatus _selectedStatus = RideStatus.active;

  RideStatus get selectedStatus => _selectedStatus;

  void toggleRide(RideStatus status) {
    _selectedStatus = status;
    notifyListeners();
  }
}
