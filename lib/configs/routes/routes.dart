import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/vehicles/vehicle_model.dart';
import 'package:quick_hitch/view/auth_view/forgot_password/forgot_password_screen.dart';
import 'package:quick_hitch/view/auth_view/forgot_password/password_reset_link_screen.dart';
import 'package:quick_hitch/view/auth_view/sign_in/sign_in_screen.dart';
import 'package:quick_hitch/view/auth_view/sign_in/signin_welcome_screen.dart';
import 'package:quick_hitch/view/auth_view/sign_up/sign_up_screen.dart';
import 'package:quick_hitch/view/auth_view/sign_up/sign_up_welcome_screen.dart';
import 'package:quick_hitch/view/bottom_nav_bar.dart';
import 'package:quick_hitch/view/home/home_screen.dart';
import 'package:quick_hitch/view/home/post/add_stops/add_stops_screen.dart';
import 'package:quick_hitch/view/home/post/post_ride/post_ride_screen.dart';
import 'package:quick_hitch/view/home/post/view_ride/view_ride_screen.dart';
import 'package:quick_hitch/view/profile/change_password/change_password_screen.dart';
import 'package:quick_hitch/view/profile/update_profile/update_profile_screen.dart';
import 'package:quick_hitch/view/profile/update_travel_preferences/update_travel_preferences_screen.dart';
import 'package:quick_hitch/view/profile/user_profile/user_profile_screen.dart';
import 'package:quick_hitch/view/profile/vehicles/add_new_vehicle/add_new_vehicle_screen.dart';
import 'package:quick_hitch/view/profile/vehicles/vehicle_details/vehicles_details_screen.dart';
import 'package:quick_hitch/view/ride/ride_details/ride_details_screen.dart';
import 'package:quick_hitch/view/splash/splash_view.dart';

class Routes {
  Routes._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      // auth screens
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SigninWelcomeScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpWelcomeScreen());
      case RoutesName.emailSignIn:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignInScreen());
      case RoutesName.emailSignUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpScreen());
      case RoutesName.changePasswordScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => ChangePasswordScreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.bottomNavBar:
        return MaterialPageRoute(
            builder: (BuildContext context) => BottomNavBar());
      case RoutesName.forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => ForgotPasswordScreen());
      case RoutesName.passwordResetLinkScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                PasswordResetLinkScreen(email: settings.arguments as String));
      case RoutesName.updateProfileScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => UpdateProfileScreen());
      case RoutesName.updateTravelPreferenceScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => UpdateTravelPreferencesScreen());
      case RoutesName.userProfileScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => UserProfileScreen());
      case RoutesName.vehicleDetailScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => VehiclesDetailsScreen());
      case RoutesName.addNewVehicleScreen:
        final arguments = settings.arguments;
        if (arguments is VehicleModel) {
          return MaterialPageRoute(
            builder: (BuildContext context) => AddNewVehicleScreen(
              vehicleId: arguments.id, // Assuming `id` is a String
              isUpdate: true,
            ),
          );
        } else {
          return MaterialPageRoute(
            builder: (BuildContext context) => const AddNewVehicleScreen(),
          );
        }
      case RoutesName.postRideScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => PostRideScreen());
      case RoutesName.addStopsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => AddStopsScreen());
      case RoutesName.viewRideScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => ViewRideScreen());
      case RoutesName.rideDeatilsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => RideDetailsScreen(
                  arguments: settings.arguments as Map<String, dynamic>,
                ));

      // case RoutesName.login:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const LoginView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
