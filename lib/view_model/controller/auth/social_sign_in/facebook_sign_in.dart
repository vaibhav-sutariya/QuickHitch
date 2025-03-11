import 'package:flutter/foundation.dart';
import 'package:quick_hitch/repository/auth_repository/auth_repository.dart';

class FacebookSignInProvider with ChangeNotifier {
  final AuthRepository authRepository = AuthRepository();

  bool _facebookSignInLoading = false;
  bool get facebookSignInLoading => _facebookSignInLoading;

  void setFacebookSignInLoading(bool value) {
    _facebookSignInLoading = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> facebookSignIn() async {
    return null;

    // try {
    //   setFacebookSignInLoading(true);

    //   // final LoginResult result = await FacebookAuth.instance.login();
    //   // if (result.status == LoginStatus.success) {
    //     // final AccessToken? accessToken = result.accessToken;
    //     // if (accessToken == null) {
    //     //   log("Error: Facebook Access Token is null.");
    //     //   setFacebookSignInLoading(false);
    //     //   return null;
    //     // }

    //     // log("Facebook Access Token: $accessToken");

    //     // Send Access Token to backend
    //     // UserModel response =
    //     //     await authRepository.facebookSigninApi(accessToken.tokenString);

    //     // Save session data
    //     // if (response.user != null) {
    //     //   await SessionController()
    //     //       .saveUserInPreference(response.user!.id, response.token);
    //     //   await SessionController().getUserFromPreference();
    //     // }

    //     // log("Facebook Sign-In API Response: ${response.toJson()}");

    //     // setFacebookSignInLoading(false);
    //     // return response;
    //   } else {
    //     // log("Facebook Sign-In cancelled.");
    //     // setFacebookSignInLoading(false);
    //     // return null;
    //   }
    // } catch (e) {
    //   log("Facebook Sign-In Error: $e");
    //   setFacebookSignInLoading(false);
    //   return null;
    // }
  }
}
