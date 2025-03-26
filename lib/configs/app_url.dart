class AppUrl {
  AppUrl._();

  // static var baseUrl = 'http://172.21.80.111:8000/v1';
  static var baseUrl = 'http://localhost:8000/v1';

  static var loginApiEndPoint = '$baseUrl/auth/login';
  static var registerApiEndPoint = '$baseUrl/auth/register';
  static var forgotPasswordApiEndPoint = '$baseUrl/auth/forgot-password';
  static var resetPasswordApiEndPoint = '$baseUrl/auth/reset-password';
  static var changePasswordApiEndPoint = '$baseUrl/user/change-password';
  static var verifyEmailEndPoint = '$baseUrl/auth/verify-email?token=';
  static var googleSigninEndPoint = '$baseUrl/auth/google/login';
  static var facebookSigninEndPoint = '$baseUrl/auth/facebook/login';
  static var appleSigninEndPoint = '$baseUrl/auth/apple/login';
  static var updateProfileEndPoint = '$baseUrl/user/profile';
  static var travelPreferencesEndPoint = '$baseUrl/user/travel-preferences';
  static var getUserProfileEndPoint = '$baseUrl/user/profile/';
  static var addVehicleEndPoint = '$baseUrl/vehicles/';
  static var getVehiclesEndPoint = '$baseUrl/vehicles/';
  static var deleteVehiclesEndPoint = '$baseUrl/vehicles/';
  static var updateVehiclesEndPoint = '$baseUrl/vehicles/';
  static var findOneVehicleEndPoint = '$baseUrl/vehicles/';
  static var makeEndPoint = '$baseUrl/vehicles/make';
  static var createRideEndPoint = '$baseUrl/user/rides';
  static var cancelRideEndPoint = '$baseUrl/user/rides/';
  static var getRidesEndPoint = '$baseUrl/user/rides?status=';
  static var searchAndFileterEndPoint = '$baseUrl/rides/search?';
  static var recentSearchEndPoint = '$baseUrl/rides/search-history';
  static var addCardEndPoint = '$baseUrl/user/card';
  static var getAllCardsEndPoint = '$baseUrl/user/cards';
  static var setDefaultCardEndPoint = '$baseUrl/user/card/default';
  static var createBookingEndPoint = '$baseUrl/user/ride/booking';
  static var getBookingDetailsEndPoint = '$baseUrl/user/ride/bookings';
  static var cancelBookingEndPoint = '$baseUrl/user/ride-booking-cancel';
  static var listRideBookingRequestEndPoint = '$baseUrl/user/ride/';
  static var rideBookingConfirmEndPoint = '$baseUrl/user/ride/booking/confirm';
  static var rideBookingRejectEndPoint = '$baseUrl/user/ride/booking/reject';
}
