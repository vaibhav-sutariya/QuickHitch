import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/repository/ride_request/create_ride_request_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

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

  Future<Map<String, dynamic>> createRideRequest(BuildContext context) async {
    try {
      String token = await getToken();

      final data = {
        'origin': departureLocation,
        'destination': destinationLocation,
        'originLat': departureLat.toString(),
        'originLong': departureLng.toString(),
        'destinationLat': destinationLat.toString(),
        'destinationLong': destinationLng.toString(),
        'distance': _distance != null
            ? double.tryParse(_distance?.toStringAsFixed(2) ?? '0.0')
            : 0.0,
        'departureDate': _selectedDate.toString(),
        'description': description,
        'emptySeats': _selectedSeat,
      };

      final response =
          await CreateRideRequestRepository().createRideRequest(data, token);

      if (response['message']?.toLowerCase() ==
          "ride request created successfully") {
        log("Create Ride Request Successfully: $response");

        String rideRequestId = response['data']['rideRequest']['id'] ?? "N/A";
        log("Ride Request ID: $rideRequestId");

        List matchingRides = response['data']['matchingRides'] ?? [];
        await Future.delayed(Duration(seconds: 1));
        if (matchingRides.isNotEmpty) {
          log("Matching Ride ID: ${matchingRides[0]['id']}");
          Navigator.pushNamed(
            context,
            RoutesName.matchingRidesScreen,
            arguments: rideRequestId,
          );
        } else {
          log("No matching rides found");
        }

        Utils.flushBarSuccessMessage(
            'Ride Request Created Successfully', context);

        clearData();
        return response;
      } else {
        throw Exception("Create Ride Request failed: ${response['message']}");
      }
    } catch (e) {
      log("Create Ride Request Error: $e");
      throw Exception("Create Ride Request failed: $e");
    }
  }

  void clearData() {
    departureLocation = null;
    departureLat = null;
    departureLng = null;
    destinationLocation = null;
    destinationLat = null;
    destinationLng = null;
    _distance = null;
    _selectedDate = null;
    _description = null;
    _selectedSeat = 1;
    notifyListeners();
  }
}
