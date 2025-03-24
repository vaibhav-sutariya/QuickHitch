import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/repository/profile_repository/update_travel_preference_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class UpdateTravelPreferencesViewModel with ChangeNotifier {
  UpdateTravelPreferenceRepository repository =
      UpdateTravelPreferenceRepository();
  final Map<String, int> _preferences = {
    "Conversation": 1,
    "Music": 1,
    "Pet": 1,
    "Smoking": 1,
  };

  int getPreference(String key) => _preferences[key] ?? 1;

  void updatePreference(String key, int index) {
    _preferences[key] = index;
    notifyListeners();
  }

  bool _updateTravelProfileLoading = false;
  bool get updateTravelProfileLoading => _updateTravelProfileLoading;

  setupdateTravelProfileLoading(bool value) {
    _updateTravelProfileLoading = value;
    notifyListeners();
  }

  Future<Map<String, int>> updateTravelPreferences() async {
    final token = await getToken();

    String dialog = _preferences['Conversation'].toString();
    if (_preferences['Conversation'] == 0) {
      dialog = 'NO';
    } else if (_preferences['Conversation'] == 1) {
      dialog = 'MAYBE';
    } else {
      dialog = 'YES';
    }
    log('dialog: $dialog');

    String music = _preferences['Music'].toString();
    if (_preferences['Music'] == 0) {
      music = 'NO';
    } else if (_preferences['Music'] == 1) {
      music = 'MAYBE';
    } else {
      music = 'YES';
    }
    log('music: $music');

    String pet = _preferences['Pet'].toString();
    if (_preferences['Pet'] == 0) {
      pet = 'NO';
    } else if (_preferences['Pet'] == 1) {
      pet = 'MAYBE';
    } else {
      pet = 'YES';
    }
    log('pet: $pet');

    String smoking = _preferences['Smoking'].toString();
    if (_preferences['Smoking'] == 0) {
      smoking = 'NO';
    } else if (_preferences['Smoking'] == 1) {
      smoking = 'MAYBE';
    } else {
      smoking = 'YES';
    }
    log('smoking: $smoking');

    final data = {
      'dialog': dialog,
      'music': music,
      'pets': pet,
      'smoking': smoking,
    };
    log(data.toString());
    try {
      setupdateTravelProfileLoading(true);
      repository.updateTravelPreferences(data, token);
      setupdateTravelProfileLoading(false);
    } catch (e) {
      setupdateTravelProfileLoading(false);
      print(e);
    } finally {
      setupdateTravelProfileLoading(false);
    }
    // log(_preferences.entries.last.value.toString());

    return _preferences;
  }
}
