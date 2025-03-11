import 'dart:developer';

import 'package:quick_hitch/view_model/services/session_manager.dart/session_controller.dart';

Future<String> getToken() async {
  final token =
      await SessionController().sharedPreferenceClass.readValue('token');
  log('Token: $token');
  return token;
}
