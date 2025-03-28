import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/model/vehicles/vehicle_model.dart';
import 'package:quick_hitch/repository/ride_repository/create_ride_repository.dart';
import 'package:quick_hitch/view/home/widgets/place_enter_field.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/get_all_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

enum BookingPreference { requestToBook, instantBooking }

class PostRideViewModel with ChangeNotifier {
  PostRideViewModel() {
    fetchVehicle();
  }

  GetAllVehicleViewModel getAllVehicleViewModel = GetAllVehicleViewModel();
  final List<Widget> _stops = [];
  // final List<Map<String, dynamic>> _allLocations = [];
  final List<Map<String, dynamic>> _stopLocations = [];
  final List<Map<String, dynamic>> _rideStops = [];

  bool _isReturn = false;

  List<Widget> get stops => _stops;
  List<Map<String, dynamic>> get stopLocations => _stopLocations;
  List<Map<String, dynamic>> get rideStops => _rideStops;
  bool get isReturn => _isReturn;

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  DateTime? _returnDate;
  TimeOfDay? _returnTime;
  int? _pricePerSeat;
  String? _description;
  String _selectedLuggage = 'M';
  int _backRowSeating = 0;

  DateTime? get selectedDate => _selectedDate;
  TimeOfDay? get selectedTime => _selectedTime;
  DateTime? get returnDate => _returnDate;
  TimeOfDay? get returnTime => _returnTime;
  int? get pricePerSeat => _pricePerSeat;
  String? get description => _description;
  String get selectedLuggage => _selectedLuggage;
  int get backRowSeating => _backRowSeating;

  double? _distance;
  double? get distance => _distance;

  String? departureLocation;
  double? departureLat;
  double? departureLng;

  String? destinationLocation;
  double? destinationLat;
  double? destinationLng;

  void addStop() {
    _stops.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: PlaceEnterField(
          iconColor: AppColors.darkColor,
          hintText: 'Enter stop location',
          isStop: true,
          onLocationSelected: (location, lat, lng) {
            setStopLocation(location, lat, lng);
          },
          onRemove: () => removeStop(_stops.length - 1),
        ),
      ),
    );
    notifyListeners();
  }

  void removeStop(int index) {
    if (index >= 0 && index < _stops.length) {
      _stops.removeAt(index - 1);
      if (index < _stopLocations.length) {
        _stopLocations.removeAt(index);
      }
      notifyListeners();
      generateRideSegments();
    }
  }

  void setStopLocation(String location, [double lat = 0.0, double lng = 0.0]) {
    if (lat != 0.0 && lng != 0.0) {
      _stopLocations.add({
        'name': location,
        'lat': lat,
        'lng': lng,
        'order': _stopLocations.length + 1,
      });
      log('Stop Location Added: $location, Lat: $lat, Lng: $lng');
      notifyListeners();
      generateRideSegments();
    }
  }

  void setDepartureLocation(String location, double lat, double lng) {
    departureLocation = location;
    departureLat = lat;
    departureLng = lng;
    log('Departure Location: $departureLocation, Lat: $lat, Lng: $lng');
    calculateDistance();
    notifyListeners();

    generateRideSegments();
  }

  void setDestinationLocation(String location, double lat, double lng) {
    destinationLocation = location;
    destinationLat = lat;
    destinationLng = lng;
    log('Destination Location: $destinationLocation, Lat: $lat, Lng: $lng');
    calculateDistance();
    notifyListeners();

    generateRideSegments();
  }

  void setLuggageSize(String size) {
    if (['S', 'M', 'L'].contains(size)) {
      _selectedLuggage = size;
      notifyListeners();
    }
  }

  void setBackRowSeating(int count) {
    _backRowSeating = count;
    notifyListeners();
  }

  void generateRideSegments() {
    _rideStops.clear();

    // First, check if we have both departure and destination
    if (departureLocation == null ||
        destinationLocation == null ||
        departureLat == null ||
        departureLng == null ||
        destinationLat == null ||
        destinationLng == null) {
      log('Missing departure or destination data');
      return;
    }

    List<Map<String, dynamic>> orderedWaypoints = [];

    // orderedWaypoints.add({
    //   'name': departureLocation,
    //   'lat': departureLat,
    //   'lng': departureLng,
    //   'order': 1,
    // });

    int order = 1;
    if (_stopLocations.isNotEmpty) {
      for (var stop in _stopLocations) {
        orderedWaypoints.add({
          'name': stop['name'],
          'lat': stop['lat'],
          'lng': stop['lng'],
          'order': order++,
        });
      }
    }

    // orderedWaypoints.add({
    //   'name': destinationLocation,
    //   'lat': destinationLat,
    //   'lng': destinationLng,
    //   'order': order,
    // });

    for (int i = 0; i < orderedWaypoints.length - 1; i++) {
      var origin = orderedWaypoints[i];
      var destination = orderedWaypoints[i + 1];

      double originLat = origin['lat'] as double;
      double originLng = origin['lng'] as double;
      double destLat = destination['lat'] as double;
      double destLng = destination['lng'] as double;

      double segmentDistance =
          Geolocator.distanceBetween(originLat, originLng, destLat, destLng) /
              1000; // Convert to km
      _rideStops.add({
        'origin': origin['name'],
        'destination': destination['name'],
        'originLat': originLat.toString(),
        'originLong': originLng.toString(),
        'destinationLat': destLat.toString(),
        'destinationLong': destLng.toString(),
        'distance': segmentDistance.round(),
        'emptySeats': _selectedSeat,
        'pricePerSeat': _calculatePriceForDistance(
            _pricePerSeat!.toInt(), segmentDistance.round()),
      });
    }

    for (int i = 0; i < orderedWaypoints.length - 2; i++) {
      for (int j = i + 2; j < orderedWaypoints.length; j++) {
        var origin = orderedWaypoints[i];
        var destination = orderedWaypoints[j];

        double originLat = origin['lat'] as double;
        double originLng = origin['lng'] as double;
        double destLat = destination['lat'] as double;
        double destLng = destination['lng'] as double;

        double segmentDistance =
            Geolocator.distanceBetween(originLat, originLng, destLat, destLng) /
                1000; // Convert to km
        int segmentPrice = _calculatePriceForDistance(
            pricePerSeat!.toInt(), segmentDistance.round());

        _rideStops.add({
          'origin': origin['name'],
          'destination': destination['name'],
          'originLat': originLat.toString(),
          'originLong': originLng.toString(),
          'destinationLat': destLat.toString(),
          'destinationLong': destLng.toString(),
          'distance': segmentDistance.round(),
          'emptySeats': _selectedSeat,
          'pricePerSeat': segmentPrice,
        });
      }
    }

    log('Generated Ride Segments: $_rideStops');
    notifyListeners();
  }

  int _calculatePriceForDistance(int basePrice, int distance) {
    if (distance <= 0) return basePrice;

    return (basePrice * distance / 10).round();
  }

  void setPricePerSeat(String price) {
    _pricePerSeat = price.isNotEmpty ? int.tryParse(price) : null;
    log('Price Per Seat: $_pricePerSeat');
    generateRideSegments();
    notifyListeners();
  }

  void setDescription(String description) {
    _description = description;
    log('Description: $_description');
    notifyListeners();
  }

  void pickDate(BuildContext context, {bool isReturnTrip = false}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      if (isReturnTrip) {
        _returnDate = pickedDate;
        log('Return Date: $_returnDate');
      } else {
        _selectedDate = pickedDate;
        log('Departure Date: $_selectedDate');
      }
      notifyListeners();
    }
  }

  void pickTime(BuildContext context, {bool isReturnTrip = false}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      if (isReturnTrip) {
        _returnTime = pickedTime;
        log('Return Time: $_returnTime');
      } else {
        _selectedTime = pickedTime;
        log('Departure Time: $_selectedTime');
      }
      notifyListeners();
    }
  }

  void toggleReturnTrip() {
    _isReturn = !_isReturn;
    if (!_isReturn) {
      _returnDate = null;
      _returnTime = null;
    }
    notifyListeners();
  }

  int _selectedSeat = 1;
  int get selectedSeat => _selectedSeat;

  void updateSelectedSeat(int seatNumber) {
    log('Selected Seat: $seatNumber');
    _selectedSeat = seatNumber;
    generateRideSegments();
    notifyListeners();
  }

  List<VehicleModel> _vehicles = [];
  VehicleModel? _selectedVehicle;

  List<VehicleModel> get vehicles => _vehicles;
  VehicleModel? get selectedVehicle => _selectedVehicle;

  Future<void> fetchVehicle() async {
    await getAllVehicleViewModel.getAllVehicles();
    _vehicles = getAllVehicleViewModel.vehicles;

    if (_vehicles.isNotEmpty) {
      _selectedVehicle = _vehicles.first;
    } else {
      _selectedVehicle = null;
    }

    log('Fetched Vehicles: $_vehicles');
    notifyListeners();
  }

  void setSelectedVehicle(VehicleModel vehicle) {
    _selectedVehicle = vehicle;
    notifyListeners();
  }

  BookingPreference _selectedPreference = BookingPreference.requestToBook;
  BookingPreference get selectedPreference => _selectedPreference;

  void setPreference(BookingPreference preference) {
    _selectedPreference = preference;
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

  void ensureRideSegmentsGenerated() {
    if (_rideStops.isEmpty) {
      generateRideSegments();
    }
  }

  String? _combineDateTime(DateTime? date, TimeOfDay? time) {
    if (date == null) return null;
    if (time == null) return date.toUtc().toIso8601String();

    // Ensure DateTime is in the correct timezone
    DateTime localDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    // Convert to UTC by adjusting the timezone offset manually
    DateTime utcDateTime = DateTime.utc(
      localDateTime.year,
      localDateTime.month,
      localDateTime.day,
      localDateTime.hour,
      localDateTime.minute,
    );

    return utcDateTime.toIso8601String();
  }

  List<Map<String, dynamic>> _formatRideWaypoints() {
    List<Map<String, dynamic>> waypoints = [];

    // waypoints.add({'name': departureLocation, 'order': 1});

    int order = 1;
    for (var stop in _stopLocations) {
      waypoints.add({
        'name': stop['name'],
        'order': order++,
      });
    }

    // waypoints.add({
    //   'name': destinationLocation,
    //   'order': order,
    // });

    return waypoints;
  }

  Map<String, dynamic> data() {
    ensureRideSegmentsGenerated();

    // Get the payment type from selected preference
    String paymentType = _selectedPreference == BookingPreference.instantBooking
        ? 'INSTANT'
        : 'REQUEST';

    return {
      'origin': departureLocation,
      'destination': destinationLocation,
      'originLat': departureLat,
      'originLong': departureLng,
      'destinationLat': destinationLat,
      'destinationLong': destinationLng,
      'distance': _distance?.toStringAsFixed(2),
      'departureDate': _combineDateTime(_selectedDate, _selectedTime),
      'description': description,
      'emptySeats': selectedSeat,
      'vehicleId': selectedVehicle?.id.toString(),
      'pricePerSeat': pricePerSeat,
      'luggageSize': selectedLuggage,
      'paymentType': paymentType,
      'backRowSeating': backRowSeating,
      'returnDate': _combineDateTime(_returnDate, _returnTime),
      'rideWaypoints': _formatRideWaypoints(),
      'rideStops': _rideStops,
    };
  }

  void postRide(BuildContext context) {
    ensureRideSegmentsGenerated();

    Map<String, dynamic> data = this.data();

    log('Post Ride Data: $data');
  }

  Future<Map<String, dynamic>> createRide(BuildContext context) async {
    try {
      String token = await getToken();
      String paymentType =
          _selectedPreference == BookingPreference.instantBooking
              ? 'INSTANT'
              : 'REQUEST';
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
        'departureDate': _combineDateTime(_selectedDate, _selectedTime),
        'description': description,
        'emptySeats': _selectedSeat,
        'vehicleId': selectedVehicle?.id.toString(),
        'pricePerSeat': pricePerSeat,
        'luggageSize': selectedLuggage,
        'paymentType': paymentType,
        'backRowSeating': backRowSeating >= 2 ? backRowSeating : 2,
        'returnDate': _combineDateTime(_selectedDate, _selectedTime),
        'rideWaypoints': _formatRideWaypoints(),
        'rideStops': _rideStops,
      };
      final response = await CreateRideRepository().createRide(data, token);
      // ✅ Check response status correctly
      if (response['status'] == 201 ||
          response['message'] == "Ride created successfully") {
        log("Ride Created Successfully: $response");
        Utils.flushBarSuccessMessage('Ride Created SuccessFully', context);
        // await Future.delayed(Duration(seconds: 1));
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.bottomNavBar, (route) => false);
        clearData();
        return response;
      } else {
        throw Exception("Ride Create failed: ${response['message']}");
      }
    } catch (e) {
      log("Ride Create Error: $e"); // Add this log
      throw Exception("Ride Create failed: $e");
    } finally {}
  }

  void clearData() {
    _stops.clear();
    _stopLocations.clear();
    _rideStops.clear();
    _isReturn = false;
    _pricePerSeat = null;
    _description = null;
    _selectedLuggage = 'M';
    _backRowSeating = 0;
    _distance = null;
    departureLocation = null;
    departureLat = null;
    departureLng = null;
    destinationLocation = null;
    destinationLat = null;
    destinationLng = null;
    _selectedVehicle = null;
    _selectedPreference = BookingPreference.requestToBook;
    _selectedSeat = 1;
    notifyListeners();
  }
}
