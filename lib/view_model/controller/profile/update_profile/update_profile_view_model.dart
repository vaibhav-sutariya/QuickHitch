import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_hitch/repository/profile_repository/update_profile_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class UpdateProfileViewModel with ChangeNotifier {
  UpdateProfileRepository updateProfileRepository = UpdateProfileRepository();

  String? selecteGender = "Select Gender";
  DateTime? _selectedDOB;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  bool _updateProfileLoading = false;
  bool get updateProfileLoading => _updateProfileLoading;

  setupdateProfileLoading(bool value) {
    _updateProfileLoading = value;
    notifyListeners();
  }

  final List<String> _genderOptions = [
    "Select Gender",
    "MALE",
    "FEMALE",
    "OTHER"
  ];

  String get selectedGender => selecteGender!;
  DateTime? get selectedDOB => _selectedDOB;
  List<String> get genderOptions => _genderOptions;
  File? get profileImage => _profileImage;

  void setGender(String gender) {
    selecteGender = gender;
    notifyListeners();
  }

  void setDOB(DateTime dob) {
    _selectedDOB = dob;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Getter and setter for firstname
  String _firstName = '';
  String get firstName => _firstName;
  setFirstName(String firstName) {
    _firstName = firstName;
  }

  // Getter and setter for lastname
  String _lastName = '';
  String get lastName => _lastName;
  setLastName(String lastName) {
    _lastName = lastName;
  }

  // Getter and setter for bio
  String _bio = '';
  String get bio => _bio;
  setbio(String bio) {
    _bio = bio;
  }

  Future<Map<String, dynamic>> updateProfile() async {
    try {
      setupdateProfileLoading(true);
      final data = {
        'firstName': _firstName,
        'lastName': _lastName,
        'dob': _selectedDOB.toString(),
        'bio': _bio,
        'gender': selecteGender,
        'role': 'RIDER',
      };
      final token = await getToken();
      log('Update profile Token: $token');
      final response = await updateProfileRepository.updateProfile(
        data,
        token,
        _profileImage, // Pass the image file
      );
      log("Update Profile Response: $response");
      setupdateProfileLoading(false);

      return response;
    } catch (e) {
      setupdateProfileLoading(false);
      log("Update Profile Error: $e");
      throw Exception(e.toString());
    } finally {
      setupdateProfileLoading(false);
    }
  }
}
