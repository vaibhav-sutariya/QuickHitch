import 'package:flutter/widgets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view/home/widgets/place_enter_field.dart';

class TextFieldsWidget extends StatelessWidget {
  const TextFieldsWidget({super.key});

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
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
