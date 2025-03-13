import 'package:flutter/widgets.dart';
import 'package:quick_hitch/configs/utils.dart';

class BookingViewModel with ChangeNotifier {
  bool _isSwitched = false;

  bool get isSwitched => _isSwitched;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }

  int _counter = 1;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 1) {
      _counter--;
      notifyListeners();
    }
  }

  // Getter and setter for email
  String _promoCode = '';
  String get promoCode => _promoCode;
  setPromocode(String promoCode) {
    _promoCode = promoCode;
  }

  String error = '';
  String get getError => error;
  set setError(String value) => error = value;

  void applyPromoCode(BuildContext context) {
    if (promoCode.isNotEmpty) {
      if (promoCode == 'DISCOUNT') {
        Utils.flushBarSuccessMessage('Promocode Applied Successfully', context);
        clearError();
        notifyListeners();
      } else {
        setError = 'This promo code is invalid, please try again.';
      }
      notifyListeners();
    } else {
      setError = 'Please enter a valid promo code';
      notifyListeners();
    }
  }

  void clearError() {
    setError = '';
    notifyListeners();
  }
}
