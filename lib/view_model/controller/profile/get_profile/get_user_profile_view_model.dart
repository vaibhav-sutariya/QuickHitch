import 'package:flutter/foundation.dart';
import 'package:quick_hitch/model/user/user_profile_model.dart';
import 'package:quick_hitch/repository/profile_repository/get_user_profile_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_id.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class GetUserProfileViewModel with ChangeNotifier {
  UserProfileModel? _userProfile;

  UserProfileModel? get userProfile => _userProfile;

  bool _getuserProfileLoading = false;
  bool get getuserProfileLoading => _getuserProfileLoading;

  setgetuserProfileLoading(bool value) {
    _getuserProfileLoading = value;
    notifyListeners();
  }

  Future<void> getUserProfile() async {
    try {
      setgetuserProfileLoading(true);
      notifyListeners();

      // Replace with actual user ID and token
      String userId = await getId();
      String token = await getToken();

      final userProfile =
          await GetUserProfileRepository().getUserProfile(userId, token);
      _userProfile = userProfile;
      setgetuserProfileLoading(false);
    } catch (e) {
      setgetuserProfileLoading(false);
      print("Error fetching profile: $e");
    } finally {
      setgetuserProfileLoading(false);
      notifyListeners();
    }
  }
}
