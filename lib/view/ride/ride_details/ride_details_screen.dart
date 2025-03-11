import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/travel_preference_widget.dart';
import 'package:quick_hitch/view/ride/ride_details/widgets/custom_btn.dart';
import 'package:quick_hitch/view/ride/ride_details/widgets/description_widget.dart';
import 'package:quick_hitch/view/ride/ride_details/widgets/location_details_widget.dart';
import 'package:quick_hitch/view/ride/ride_details/widgets/stops/stops_widget.dart';
import 'package:quick_hitch/view/ride/ride_details/widgets/vehicle_widget.dart';
import 'package:quick_hitch/view_model/controller/profile/get_profile/get_user_profile_view_model.dart';

class RideDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> arguments;

  const RideDetailsScreen({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    final Rides ride = arguments['ride'] as Rides;

    return Scaffold(
      appBar: CustomAppBar(
          title:
              '${ride.origin.toString().split(',')[0]}  to  ${ride.destination.toString().split(',')[0]}',
          isLeading: true,
          isAction: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Ride details',
                    style: TextStyle(
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                LocationDetailsWidget(
                  ride: ride,
                ),
                SizedBox(height: 10),
                CustomDivider(),
                YourStop(
                  rideStops: ride.rideStops ?? [],
                ),
                SizedBox(height: 10),
                CustomDivider(),
                DescWidget(
                  ride: ride,
                ),
                SizedBox(height: 5),
                CustomDivider(),
                SizedBox(height: 5),
                VehicleWidget(
                  ride: ride,
                ),
                Consumer<GetUserProfileViewModel>(
                    builder: (context, provider, child) {
                  return TravelPreferencesWidget(
                    provider: provider,
                  );
                }),
                Divider(
                  height: 1,
                ),
                CustomBtn(
                  text: 'View Bookings',
                  onPressed: () {},
                ),
                CustomBtn(
                  text: 'Edit trip details',
                  onPressed: () {},
                ),
                CustomBtn(
                  color: AppColors.redColor,
                  text: 'Cancel trip',
                  onPressed: () {},
                ),
                SizedBox(height: 50),
              ],
            )
          ],
        ),
      ),
    );
  }
}
