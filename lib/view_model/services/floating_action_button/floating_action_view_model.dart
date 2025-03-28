import 'dart:developer';

import 'package:flutter/material.dart';

class FloatingActionViewModel extends ChangeNotifier {
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggle() {
    _isExpanded = !_isExpanded;
    log('Floating Action Button Expanded: $_isExpanded');
    notifyListeners();
  }
}
