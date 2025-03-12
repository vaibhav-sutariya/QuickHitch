import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view/home/widgets/place_enter_field.dart';

class FindRideScreen extends StatelessWidget {
  const FindRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Find Ride',
        isLeading: true,
        isAction: false,
      ),
      body: Column(
        children: [
          CustomDivider(),
          const SizedBox(height: 20),
          Column(
            children: [
              PlaceEnterField(
                iconColor: AppColors.greenColor2,
                hintText: 'Enter your location',
                onLocationSelected: (location, lat, lng) {
                  // viewModel.setDepartureLocation(location, lat, lng);
                  // viewModel.setStopLocation(location, lat, lng);
                },
              ),
              const SizedBox(height: 10),
              PlaceEnterField(
                iconColor: AppColors.redColor,
                hintText: 'Enter destination location',
                onLocationSelected: (location, lat, lng) {
                  // viewModel.setDestinationLocation(location, lat, lng);
                  // viewModel.setStopLocation(location, lat, lng);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
