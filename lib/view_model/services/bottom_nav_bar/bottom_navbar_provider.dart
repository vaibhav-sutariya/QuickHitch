import 'package:flutter/material.dart';

class BottomNavBarProvider with ChangeNotifier {
  int _currentIndex = 0; // Default selected index (Profile)

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
