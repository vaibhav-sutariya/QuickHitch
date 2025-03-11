import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_hitch/model/vehicles/make_model.dart';
import 'package:quick_hitch/model/vehicles/vehicle_model.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/add_car_repository.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/make_repository.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/update_vehicle_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class VehicleMgmtViewModel with ChangeNotifier {
  AddCarRepository addCarRepository = AddCarRepository();
  UpdateVehicleRepository updateVehicleRepository = UpdateVehicleRepository();
  MakeRepository makeRepository = MakeRepository();
  final VehicleModel _vehicle = VehicleModel();

  VehicleModel get vehicle => _vehicle;

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  File? get selectedImage => _selectedImage;

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      log('Selected Image: $_selectedImage');
      notifyListeners();
    }
  }

  final List<String> colors = ['Red', 'Blue', 'Black', 'White', 'Gray'];
  final List<String> years = ['2024', '2023', '2022', '2021', '2020'];

  List<MakeModel> _makes = [];
  List<MakeModel> get makes => _makes;

  MakeModel? _selectedMake;
  MakeModel? get selectedMake => _selectedMake;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> fetchMakes() async {
    _isLoading = true;
    // notifyListeners();
    try {
      final token = await getToken();
      _makes = await makeRepository.getMakes(token);
      log('Fetched Makes: $_makes');
    } catch (e) {
      log('Error loading makes: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  void updateMake(MakeModel? newMake) {
    _selectedMake = newMake;
    notifyListeners();
  }

  void updateModelName(String newModelName) {
    _vehicle.modelName = newModelName;
    notifyListeners();
  }

  void updateColor(String? newColor) {
    _vehicle.color = newColor;
    notifyListeners();
  }

  void updateMakeYear(int? newYear) {
    _vehicle.makeYear = newYear;
    notifyListeners();
  }

  void updateRegistrationNumber(String newRegNum) {
    _vehicle.registrationNumber = newRegNum;
    notifyListeners();
  }

  int _selectedSeat = 1;
  int get selectedSeat => _selectedSeat;
  void updateSelectedSeat(int seatNumber) {
    _vehicle.noOfSeats = seatNumber;
    _selectedSeat = seatNumber;
    notifyListeners();
  }

  int _selectedOption = 2;

  int get selectedOption => _selectedOption;
  void updateSelection(int option) {
    _vehicle.backRowSeating = option;
    _selectedOption = option;
    notifyListeners();
  }

  String _luggageSelectedOption = "No luggage";

  String get luggageSelectedOption => _luggageSelectedOption;
  void updateLuggageSelection(String option) {
    _vehicle.luggage = option;
    _luggageSelectedOption = option;
    notifyListeners();
  }

  bool _isDefault = false;

  bool get isDefault => _isDefault;

  void toggleDefault() {
    _vehicle.isDefault = !_isDefault;
    _isDefault = !_isDefault;

    // notifyListeners();
  }

  bool _addVehicleLoading = false;
  bool get addVehicleLoading => _addVehicleLoading;

  setaddVehicleLoading(bool value) {
    _addVehicleLoading = value;
    notifyListeners();
  }

  Future<VehicleModel> addVehicle() async {
    try {
      setaddVehicleLoading(true);

      final data = {
        'model': _vehicle.modelName,
        'licencePlate': _vehicle.registrationNumber,
        'color': _vehicle.color,
        'year': _vehicle.makeYear,
        'photo': _selectedImage?.path,
        'noOfSeats': _vehicle.noOfSeats,
        'backRowSeating': _vehicle.backRowSeating,
        'luggage': _vehicle.luggage,
        'isDefault': _vehicle.isDefault,
        'makeId': selectedMake?.id,
      };
      log("Add vehicle Data: $data");
      final token = await getToken();
      final response = await addCarRepository.addVehicle(
        data,
        token,
        _selectedImage,
      );
      log("Add vehicle Response: $response");
      setaddVehicleLoading(false);

      return response;
    } catch (e) {
      log("Update Profile Error: $e");
      setaddVehicleLoading(false);
      throw Exception(e.toString());
    } finally {
      setaddVehicleLoading(false);
    }
  }

  bool _updateVehicleLoading = false;
  bool get updateVehicleLoading => _updateVehicleLoading;
  setupdateVehicleLoading(bool value) {
    _updateVehicleLoading = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> updateVehicle(String id) async {
    try {
      setupdateVehicleLoading(true);

      final data = {
        'model': _vehicle.modelName,
        'licencePlate': _vehicle.registrationNumber,
        'color': _vehicle.color,
        'year': _vehicle.makeYear,
        'photo': _selectedImage?.path,
        'noOfSeats': _vehicle.noOfSeats,
        'backRowSeating': _vehicle.backRowSeating,
        'luggage': _vehicle.luggage,
        'isDefault': _vehicle.isDefault,
        'makeId': selectedMake?.id,
      };
      final token = await getToken();
      log('Update Vehicle Token: $token');
      final response = await updateVehicleRepository.updateVehicle(
        id,
        data,
        token,
        _selectedImage, // Pass the image file
      );
      log("Update Vehicle Response: $response");
      setupdateVehicleLoading(false);

      return response;
    } catch (e) {
      setupdateVehicleLoading(false);
      log("Update Vehicle Error: $e");
      throw Exception(e.toString());
    } finally {
      setupdateVehicleLoading(false);
    }
  }
}
