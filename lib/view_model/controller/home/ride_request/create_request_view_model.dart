import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CreateRequestViewModel with ChangeNotifier {
  String? departureLocation;
  double? departureLat;
  double? departureLng;

  String? destinationLocation;
  double? destinationLat;
  double? destinationLng;

  double? _distance;
  double? get distance => _distance;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  String? _description;
  String? get description => _description;

  void setDepartureLocation(String location, double lat, double lng) {
    departureLocation = location;
    departureLat = lat;
    departureLng = lng;
    log('Departure Location: $departureLocation, Lat: $lat, Lng: $lng');
    calculateDistance();
    notifyListeners();
  }

  void setDestinationLocation(String location, double lat, double lng) {
    destinationLocation = location;
    destinationLat = lat;
    destinationLng = lng;
    log('Destination Location: $destinationLocation, Lat: $lat, Lng: $lng');
    calculateDistance();
    notifyListeners();
  }

  void calculateDistance() {
    if (departureLat != null &&
        departureLng != null &&
        destinationLat != null &&
        destinationLng != null) {
      _distance = Geolocator.distanceBetween(
              departureLat!, departureLng!, destinationLat!, destinationLng!) /
          1000; // Convert meters to kilometers

      log('Distance: ${_distance!.toStringAsFixed(2)} km');
      notifyListeners();
    }
  }

  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    log('Picked Date: $pickedDate');

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      notifyListeners();
    }
  }

  int _selectedSeat = 1;
  int get selectedSeat => _selectedSeat;

  void updateSelectedSeat(int seatNumber) {
    log('Selected Seat: $seatNumber');
    _selectedSeat = seatNumber;
    notifyListeners();
  }

  void setDescription(String description) {
    _description = description;
    log('Description: $_description');
    notifyListeners();
  }
}
