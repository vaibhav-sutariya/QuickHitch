import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';
import 'package:quick_hitch/repository/search_ride_repository/search_filter_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class SearchRideViewModel with ChangeNotifier {
  SearchRideModel? _rides;
  SearchRideModel? get rides => _rides;

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
      log('Selected Date: $_selectedDate');
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

  int _selectedSeat = 1;
  int get selectedSeat => _selectedSeat;

  void updateSelectedSeat(int seatNumber) {
    log('Selected Seat: $seatNumber');
    _selectedSeat = seatNumber;
    notifyListeners();
  }

  Future<void> searchAndfilterRides(BuildContext context) async {
    try {
      setgetSearchAndFilterRidesLoading(true);
      String token = await getToken();
      log('search filter token: $token');

      final String origin = departureLocation ?? '';
      final String originLat = departureLat.toString();
      final String originLong = departureLng.toString();
      final String destination = destinationLocation ?? '';
      final String destinationLt = destinationLat.toString();
      final String destinationLong = destinationLng.toString();
      final int emptySeats = selectedSeat;
      final rides = await SearchFilterRepository().searchAndFilterRide(
          token,
          origin,
          originLat,
          originLong,
          destination,
          destinationLt,
          destinationLong,
          emptySeats);

      _rides = rides;
      if (_rides!.rides!.isEmpty) {
        log('No rides found');
        Navigator.pushNamed(context, RoutesName.noRideScreen);
      } else {
        log('Rides found: ${_rides!.rides!.length}');
        Navigator.pushNamed(context, RoutesName.rideFoundScreen);
      }
    } catch (e) {
      log("Error search and filter rides: $e");
    } finally {
      setgetSearchAndFilterRidesLoading(false);
      notifyListeners();
    }
  }

  // filter

  double _minPrice = 80;
  double _maxPrice = 140;

  final Map<String, String> _preferences = {
    'Conversation': 'Maybe',
    'Pet': 'Maybe',
    'Music': 'Maybe',
    'Smoking': 'Maybe',
  };

  double get minPrice => _minPrice;
  double get maxPrice => _maxPrice;
  Map<String, String> get preferences => _preferences;

  void setPriceRange(double min, double max) {
    _minPrice = min;
    _maxPrice = max;
    log('Min Price: $_minPrice, Max Price: $_maxPrice');
    notifyListeners();
  }

  void setPreference(String key, String value) {
    if (_preferences.containsKey(key)) {
      _preferences[key] = value;
      log('Updated Preferences: $_preferences');
      notifyListeners();
    }
  }

  int getPreferenceIndex(String key) {
    if (!_preferences.containsKey(key))
      return 1; // Default to 'Maybe' (index 1)
    switch (_preferences[key]) {
      case 'No':
        return 0;
      case 'Maybe':
        return 1;
      case 'Yes':
        return 2;
      default:
        return 1;
    }
  }

  String getPreferenceValue(int index) {
    switch (index) {
      case 0:
        return 'No';
      case 1:
        return 'Maybe';
      case 2:
        return 'Yes';
      default:
        return 'Maybe';
    }
  }

  void clearAll() {
    _minPrice = 80;
    _maxPrice = 140;
    _preferences.updateAll((key, value) => 'Maybe');
    notifyListeners();
  }
}
