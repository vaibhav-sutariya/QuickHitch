import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/home/card_model.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';
import 'package:quick_hitch/model/vehicles/vehicle_model.dart';
import 'package:quick_hitch/view/auth_view/forgot_password/forgot_password_screen.dart';
import 'package:quick_hitch/view/auth_view/forgot_password/password_reset_link_screen.dart';
import 'package:quick_hitch/view/auth_view/sign_in/sign_in_screen.dart';
import 'package:quick_hitch/view/auth_view/sign_in/signin_welcome_screen.dart';
import 'package:quick_hitch/view/auth_view/sign_up/sign_up_screen.dart';
import 'package:quick_hitch/view/auth_view/sign_up/sign_up_welcome_screen.dart';
import 'package:quick_hitch/view/bottom_nav_bar.dart';
import 'package:quick_hitch/view/home/find/booking_details/booking_details_screen.dart';
import 'package:quick_hitch/view/home/find/booking_instructions/booking_instruction_screen.dart';
import 'package:quick_hitch/view/home/find/booking_request_screen/booking_request_screen.dart';
import 'package:quick_hitch/view/home/find/booking_summary/booking_summary_screen.dart';
import 'package:quick_hitch/view/home/find/booking_summary/payment_policy_screen.dart';
import 'package:quick_hitch/view/home/find/cancel_booking/cancel_booking_screen.dart';
import 'package:quick_hitch/view/home/find/find_ride_screen.dart';
import 'package:quick_hitch/view/home/find/found_view/found_view_ride_screen.dart';
import 'package:quick_hitch/view/home/find/no_ride_found/no_ride_screen.dart';
import 'package:quick_hitch/view/home/find/payment/add_new_card/add_new_card_screen.dart';
import 'package:quick_hitch/view/home/find/payment/payment_screen.dart';
import 'package:quick_hitch/view/home/find/refund_details/refund_details_screen.dart';
import 'package:quick_hitch/view/home/find/ride_found/ride_found_screen.dart';
import 'package:quick_hitch/view/home/find/seat_price/seat_price_scren.dart';
import 'package:quick_hitch/view/home/home_screen.dart';
import 'package:quick_hitch/view/home/post/add_stops/add_stops_screen.dart';
import 'package:quick_hitch/view/home/post/post_ride/post_ride_screen.dart';
import 'package:quick_hitch/view/home/post/view_ride/view_ride_screen.dart';
import 'package:quick_hitch/view/home/ride_request/create_ride_request_screen.dart';
import 'package:quick_hitch/view/home/ride_request/matching_rides/matching_rides_screen.dart';
import 'package:quick_hitch/view/profile/change_password/change_password_screen.dart';
import 'package:quick_hitch/view/profile/update_profile/update_profile_screen.dart';
import 'package:quick_hitch/view/profile/update_travel_preferences/update_travel_preferences_screen.dart';
import 'package:quick_hitch/view/profile/user_profile/user_profile_screen.dart';
import 'package:quick_hitch/view/profile/vehicles/add_new_vehicle/add_new_vehicle_screen.dart';
import 'package:quick_hitch/view/profile/vehicles/vehicle_details/vehicles_details_screen.dart';
import 'package:quick_hitch/view/ride/approve_booking/approve_booking_screen.dart';
import 'package:quick_hitch/view/ride/approved_booking_details/approved_booking_details_screen.dart';
import 'package:quick_hitch/view/ride/invite_passengers/invite_passengers_screen.dart';
import 'package:quick_hitch/view/ride/ride_booking_request/ride_booking_request_screen.dart';
import 'package:quick_hitch/view/ride/ride_details/ride_details_screen.dart';
import 'package:quick_hitch/view/splash/splash_view.dart';

class Routes {
  Routes._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    PageRouteBuilder slideTransition(Widget page) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0); // Start from right
          var end = Offset.zero; // End at center
          var curve = Curves.easeInOutQuart; // Smooth animation curve

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      );
    }

    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.login:
        return slideTransition(const SigninWelcomeScreen());
      case RoutesName.signUp:
        return slideTransition(const SignUpWelcomeScreen());
      case RoutesName.emailSignIn:
        return slideTransition(SignInScreen());
      case RoutesName.emailSignUp:
        return slideTransition(SignUpScreen());
      case RoutesName.changePasswordScreen:
        return slideTransition(const ChangePasswordScreen());
      case RoutesName.home:
        return slideTransition(const HomeScreen());
      case RoutesName.bottomNavBar:
        return slideTransition(const BottomNavBar());
      case RoutesName.forgotPasswordScreen:
        return slideTransition(const ForgotPasswordScreen());
      case RoutesName.passwordResetLinkScreen:
        return slideTransition(
            PasswordResetLinkScreen(email: settings.arguments as String));
      case RoutesName.updateProfileScreen:
        return slideTransition(const UpdateProfileScreen());
      case RoutesName.updateTravelPreferenceScreen:
        return slideTransition(const UpdateTravelPreferencesScreen());
      case RoutesName.userProfileScreen:
        return slideTransition(const UserProfileScreen());
      case RoutesName.vehicleDetailScreen:
        return slideTransition(const VehiclesDetailsScreen());

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
        return slideTransition(const PostRideScreen());
      case RoutesName.addStopsScreen:
        return slideTransition(const AddStopsScreen());
      case RoutesName.viewRideScreen:
        return slideTransition(const ViewRideScreen());
      case RoutesName.rideDeatilsScreen:
        return slideTransition(RideDetailsScreen(
          arguments: settings.arguments as Map<String, dynamic>,
        ));
      case RoutesName.findRideScreen:
        return slideTransition(const FindRideScreen());
      case RoutesName.noRideScreen:
        return slideTransition(const NoRideScreen());
      case RoutesName.rideFoundScreen:
        return slideTransition(const RideFoundScreen());
      case RoutesName.foundViewRideScreen:
        return slideTransition(FoundViewRideScreen(
          ride: settings.arguments as dynamic,
        ));
      case RoutesName.bookingInstructionScreen:
        return slideTransition(BookingInstructionScreen(
          ride: settings.arguments as dynamic,
        ));
      case RoutesName.seatPriceScreen:
        return slideTransition(SeatPriceScren(
          ride: settings.arguments as dynamic,
        ));
      case RoutesName.paymentScreen:
        return slideTransition(PaymentScreen(
          ride: settings.arguments as dynamic,
        ));
      case RoutesName.addNewCardScreen:
        return slideTransition(const AddNewCardScreen());
      case RoutesName.bookingSummaryScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return slideTransition(BookingSummaryScreen(
          ride: args['ride'] as Rides,
          card: args['card'] as CardDatas,
        ));
      case RoutesName.paymetPoliciesScreen:
        return slideTransition(const PaymentPolicyScreen());
      case RoutesName.bookingRequestScreen:
        return slideTransition(BookingRequestScreen(
          bookingId: settings.arguments as String,
        ));
      case RoutesName.bookingDetailsScreen:
        return slideTransition(BookingDetailsScreen(
            bookingId: settings.arguments as String // Handle null safety
            ));
      case RoutesName.cancelBookingScreen:
        return slideTransition(CancelBookingScreen(
          booking: settings.arguments as dynamic,
        ));
      case RoutesName.refundDetailsScreen:
        return slideTransition(
            RefundDetailsScreen(bookingId: settings.arguments as String));
      case RoutesName.rideBookingRequestScreen:
        return slideTransition(RideBookingRequestScreen(
          rideId: settings.arguments as String,
        ));
      case RoutesName.approveBookingScreen:
        return slideTransition(ApproveBookingScreen(
          bookingData: settings.arguments as dynamic,
        ));
      case RoutesName.approvedBookingDetailsScreen:
        return slideTransition(ApprovedBookingDetailsScreen(
          bookingData: settings.arguments as dynamic,
        ));
      case RoutesName.invitePaddengersScreen:
        return slideTransition(const InvitePassengersScreen());
      case RoutesName.createRideRequestScreen:
        return slideTransition(const CreateRideRequestScreen());
      case RoutesName.matchingRidesScreen:
        return slideTransition(MatchingRidesScreen(
          requestId: settings.arguments as String,
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
