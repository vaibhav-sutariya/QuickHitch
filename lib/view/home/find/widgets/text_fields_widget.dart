import 'package:flutter/widgets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view/home/widgets/place_enter_field.dart';
import 'package:quick_hitch/view_model/controller/home/search_ride_view_model.dart';

// ignore: must_be_immutable
class TextFieldsWidget extends StatelessWidget {
  SearchRideViewModel viewModel;
  TextFieldsWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          PlaceEnterField(
            iconColor: AppColors.greenColor2,
            hintText: 'Enter your location',
            onLocationSelected: (location, lat, lng) {
              viewModel.setDepartureLocation(location, lat, lng);
              // viewModel.setStopLocation(location, lat, lng);
            },
          ),
          const SizedBox(height: 10),
          PlaceEnterField(
            iconColor: AppColors.redColor,
            hintText: 'Enter destination location',
            onLocationSelected: (location, lat, lng) {
              viewModel.setDestinationLocation(location, lat, lng);
              // viewModel.setStopLocation(location, lat, lng);
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
