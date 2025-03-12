import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';
import 'package:quick_hitch/repository/search_ride_repository/search_filter_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class SearchRideViewModel with ChangeNotifier {
  RideModel? _rides;
  RideModel? get rides => _rides;

  bool _getSearchAndFilterRidesLoading = false;
  bool get getSearchAndFilterRidesLoading => _getSearchAndFilterRidesLoading;

  setgetSearchAndFilterRidesLoading(bool value) {
    _getSearchAndFilterRidesLoading = value;
    notifyListeners();
  }

  String? departureLocation;
  double? departureLat;
  double? departureLng;

  String? destinationLocation;
  double? destinationLat;
  double? destinationLng;
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  String get formattedDate => _selectedDate != null
      ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
      : 'Select Date';

  Future<void> selectDate(BuildContext context) async {
    DateTime initialDate = _selectedDate ?? DateTime.now();
    DateTime firstDate = DateTime.now();
    DateTime lastDate = DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      notifyListeners(); // Notify UI
    }
  }

  void setDepartureLocation(String location, double lat, double lng) {
    departureLocation = location;
    departureLat = lat;
    departureLng = lng;
    log('Departure Location: $departureLocation, Lat: $lat, Lng: $lng');
    notifyListeners();
  }

  void setDestinationLocation(String location, double lat, double lng) {
    destinationLocation = location;
    destinationLat = lat;
    destinationLng = lng;
    log('Destination Location: $destinationLocation, Lat: $lat, Lng: $lng');
    notifyListeners();
  }

  void pickDate(BuildContext context, {bool isReturnTrip = false}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    _selectedDate = pickedDate;
    log('Departure Date: $_selectedDate');

    notifyListeners();
  }

  int _selectedSeat = 1;
  int get selectedSeat => _selectedSeat;

  void updateSelectedSeat(int seatNumber) {
    log('Selected Seat: $seatNumber');
    _selectedSeat = seatNumber;
    notifyListeners();
  }

  Future<void> searchAndfilterRides() async {
    try {
      setgetSearchAndFilterRidesLoading(true);
      String token = await getToken();

      final String origin = departureLocation ?? '';
      final String destination = destinationLocation ?? '';
      final int emptySeats = selectedSeat;
      final rides = await SearchFilterRepository()
          .searchAndFilterRide(token, origin, destination, emptySeats);
      _rides = rides;
    } catch (e) {
      log("Error search and filter rides: $e");
    } finally {
      setgetSearchAndFilterRidesLoading(false);
      notifyListeners();
    }
  }
}
