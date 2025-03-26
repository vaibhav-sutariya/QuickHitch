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

enum RidebookingStatus { accepted, pending, rejected }

class ThreeRideBookingReqToggleProvider with ChangeNotifier {
  RidebookingStatus _selectedStatus = RidebookingStatus.pending;

  RidebookingStatus get selectedStatus => _selectedStatus;

  void toggleRide(RidebookingStatus status) {
    _selectedStatus = status;
    notifyListeners();
  }
}
