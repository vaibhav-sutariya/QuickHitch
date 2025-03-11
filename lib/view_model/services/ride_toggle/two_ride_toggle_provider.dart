import 'package:flutter/material.dart';

class TwoRideToggleProvider with ChangeNotifier {
  bool _isUpcomingSelected = true;

  bool get isUpcomingSelected => _isUpcomingSelected;

  void toggleRide(bool isUpcoming) {
    _isUpcomingSelected = isUpcoming;
    notifyListeners();
  }
}
