import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/routes/routes.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/repository/auth_repository/auth_repository.dart';
import 'package:quick_hitch/repository/auth_repository/forgot_password_repository.dart';
import 'package:quick_hitch/repository/card_repository/add_card_repository.dart';
import 'package:quick_hitch/repository/card_repository/get_card_repository.dart';
import 'package:quick_hitch/repository/profile_repository/change_password_repository.dart';
import 'package:quick_hitch/repository/profile_repository/get_user_profile_repository.dart';
import 'package:quick_hitch/repository/profile_repository/update_travel_preference_repository.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/add_car_repository.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/delete_vehicle_repository.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/find_one_vehicle_repository.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/get_all_vehicle_repository.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/make_repository.dart';
import 'package:quick_hitch/repository/profile_repository/vehicle/update_vehicle_repository.dart';
import 'package:quick_hitch/repository/ride_repository/get_all_rides_repository.dart';
import 'package:quick_hitch/view_model/controller/auth/forgot_password/forgot_password_view_model.dart';
import 'package:quick_hitch/view_model/controller/auth/login/login_view_model.dart';
import 'package:quick_hitch/view_model/controller/auth/register/register_view_model.dart';
import 'package:quick_hitch/view_model/controller/auth/social_sign_in/apple_sign_in.dart';
import 'package:quick_hitch/view_model/controller/auth/social_sign_in/facebook_sign_in.dart';
import 'package:quick_hitch/view_model/controller/auth/social_sign_in/google_sign_in.dart';
import 'package:quick_hitch/view_model/controller/bookings/booking_view_model.dart';
import 'package:quick_hitch/view_model/controller/bookings/cancel_booking_view_model.dart';
import 'package:quick_hitch/view_model/controller/bookings/get_booking_details_view_model.dart';
import 'package:quick_hitch/view_model/controller/home/card_view_model/add_new_card_view_model.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';
import 'package:quick_hitch/view_model/controller/home/recent_search_view_model.dart';
import 'package:quick_hitch/view_model/controller/home/search_ride_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/change_password/change_password_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/get_profile/get_user_profile_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/update_profile/update_profile_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/update_travel_preferences/update_travel_preferences_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/delete_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/find_one_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/get_all_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/vehicle_mgmn_view_model.dart';
import 'package:quick_hitch/view_model/controller/rides/get_all_rides_view_model.dart';
import 'package:quick_hitch/view_model/services/bottom_nav_bar/bottom_navbar_provider.dart';
import 'package:quick_hitch/view_model/services/ride_toggle/three_ride_toggle_provider.dart';
import 'package:quick_hitch/view_model/services/ride_toggle/two_ride_toggle_provider.dart';

GetIt getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  await Stripe.instance.applySettings();
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<ForgotPasswordRepository>(
      () => ForgotPasswordRepository());
  getIt.registerLazySingleton<BottomNavBarProvider>(
      () => BottomNavBarProvider());
  getIt.registerLazySingleton<ChangePasswordRepository>(
      () => ChangePasswordRepository());
  getIt.registerLazySingleton<UpdateTravelPreferenceRepository>(
      () => UpdateTravelPreferenceRepository());
  getIt.registerLazySingleton<GetUserProfileRepository>(
      () => GetUserProfileRepository());
  getIt.registerLazySingleton<AddCarRepository>(() => AddCarRepository());
  getIt.registerLazySingleton<MakeRepository>(() => MakeRepository());
  getIt.registerLazySingleton<GetAllVehicleRepository>(
      () => GetAllVehicleRepository());
  getIt.registerLazySingleton<DeleteVehicleRepository>(
      () => DeleteVehicleRepository());
  getIt.registerLazySingleton<UpdateVehicleRepository>(
      () => UpdateVehicleRepository());
  getIt.registerLazySingleton<FindOneVehicleRepository>(
      () => FindOneVehicleRepository());
  getIt.registerLazySingleton<GetAllRidesRepository>(
      () => GetAllRidesRepository());
  getIt.registerLazySingleton<AddCardRepository>(() => AddCardRepository());
  getIt.registerLazySingleton<GetCardRepository>(() => GetCardRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (_) => FacebookSignInProvider()),
        ChangeNotifierProvider(create: (_) => AppleSignIn()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (_) => ChangePasswordViewModel()),
        ChangeNotifierProvider(create: (_) => UpdateProfileViewModel()),
        ChangeNotifierProvider(create: (_) => GetUserProfileViewModel()),
        ChangeNotifierProvider(
            create: (_) => UpdateTravelPreferencesViewModel()),
        ChangeNotifierProvider(create: (_) => TwoRideToggleProvider()),
        ChangeNotifierProvider(create: (_) => ThreeRideToggleProvider()),
        ChangeNotifierProvider(create: (_) => VehicleMgmtViewModel()),
        ChangeNotifierProvider(create: (_) => GetAllVehicleViewModel()),
        ChangeNotifierProvider(create: (_) => DeleteVehicleViewModel()),
        ChangeNotifierProvider(create: (_) => FindOneVehicleViewModel()),
        ChangeNotifierProvider(create: (_) => PostRideViewModel()),
        ChangeNotifierProvider(create: (_) => GetAllRidesViewModel()),
        ChangeNotifierProvider(create: (_) => SearchRideViewModel()),
        ChangeNotifierProvider(create: (_) => RecentSearchViewModel()),
        ChangeNotifierProvider(create: (_) => AddNewCardViewModel()),
        ChangeNotifierProvider(create: (_) => BookingViewModel()),
        ChangeNotifierProvider(create: (_) => GetBookingDetailsViewModel()),
        ChangeNotifierProvider(create: (_) => CancelBookingViewModel()),
      ],
      child: MaterialApp(
        title: 'Quick Hitch',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.whiteColor,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.whiteColor,
            scrolledUnderElevation: 0.0,
          ),
          useMaterial3: true,
          fontFamily: GoogleFonts.josefinSans().fontFamily,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
