import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';
import 'package:quick_hitch/view/home/find/found_view/widgets/date_price_widget.dart';
import 'package:quick_hitch/view/home/find/found_view/widgets/driver_widget.dart';
import 'package:quick_hitch/view/home/find/found_view/widgets/n_seat_widget.dart';
import 'package:quick_hitch/view/home/find/found_view/widgets/origin_seat_widget.dart';
import 'package:quick_hitch/view/home/find/found_view/widgets/r_widget.dart';
import 'package:quick_hitch/view/home/find/found_view/widgets/veh_widget.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/travel_preference_widget.dart';
import 'package:quick_hitch/view_model/controller/profile/get_profile/get_user_profile_view_model.dart';

class FoundViewRideScreen extends StatelessWidget {
  final Rides ride;

  const FoundViewRideScreen({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'View Ride',
        isLeading: true,
        isAction: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDivider(),
          SizedBox(height: 10),
          DatePriceWidget(ride: ride),
          OriginSeatWidget(ride: ride),
          SizedBox(height: 30),
          RWidget(ride: ride),
          SizedBox(height: 20),
          CustomDivider(),
          SizedBox(height: 10),
          DriverWidget(ride: ride),
          SizedBox(height: 15),
          CustomDivider(),
          // DesWidget(ride: ride),
          SizedBox(height: 10),

          NSeatWidget(ride: ride),
          SizedBox(height: 20),
          CustomDivider(),
          SizedBox(height: 10),
          VehWidget(ride: ride),
          Consumer<GetUserProfileViewModel>(
            builder: (context, provider, child) {
              return TravelPreferencesWidget(
                provider: provider,
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: 'Next',
                    press: () => Navigator.pushNamed(
                      context,
                      RoutesName.bookingInstructionScreen,
                      arguments: ride,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  // iconSize: 30,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.darkColor,
                    shape: CircleBorder(),
                  ),
                  onPressed: () {},
                  icon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      AntDesign.message1,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
