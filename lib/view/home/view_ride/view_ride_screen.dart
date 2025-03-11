import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/view/home/view_ride/widgets/description_widget.dart';
import 'package:quick_hitch/view/home/view_ride/widgets/ride_widget.dart';
import 'package:quick_hitch/view/home/view_ride/widgets/trip_posting_rules.dart';
import 'package:quick_hitch/view/home/view_ride/widgets/vehicle_details_widget.dart';
import 'package:quick_hitch/view/home/view_ride/widgets/your_stop_widget.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/travel_preference_widget.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/get_profile/get_user_profile_view_model.dart';

class ViewRideScreen extends StatelessWidget {
  const ViewRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'View Ride',
        isLeading: true,
        isAction: false,
      ),
      body: SingleChildScrollView(
        child:
            Consumer<PostRideViewModel>(builder: (context, viewModel, child) {
          return Column(
            children: [
              CustomDivider(),
              SizedBox(height: 20),
              Column(
                children: [
                  RideWidget(
                    viewModel: viewModel,
                  ),
                  SizedBox(height: 20),
                  CustomDivider(),
                  YourStopWidget(),
                  SizedBox(height: 10),
                  CustomDivider(),
                  DescriptionWidget(
                    viewModel: viewModel,
                  ),
                  CustomDivider(),
                  SizedBox(height: 10),
                  VehicleDetailsWidget(
                    viewModel: viewModel,
                  ),
                  Consumer<GetUserProfileViewModel>(
                      builder: (context, provider, child) {
                    return TravelPreferencesWidget(
                      provider: provider,
                    );
                  }),
                  CustomDivider(),
                  TripPostingRules(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomElevatedButton(
                        text: 'Post ride',
                        press: () {
                          viewModel.createRide(context);
                        }),
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
