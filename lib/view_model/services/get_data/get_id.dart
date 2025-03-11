import 'dart:developer';

import 'package:quick_hitch/view_model/services/session_manager.dart/session_controller.dart';

Future<String> getId() async {
  final userId =
      await SessionController().sharedPreferenceClass.readValue('userId');
  log('userId: $userId');
  return userId;
}
