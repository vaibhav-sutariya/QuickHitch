import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';

// ignore: must_be_immutable
class VehicleDetailsWidget extends StatelessWidget {
  PostRideViewModel viewModel;
  VehicleDetailsWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vehicle',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
            ),
            Text(
              '${viewModel.selectedVehicle?.make?.name} ${viewModel.selectedVehicle?.modelName} (${viewModel.selectedVehicle?.makeYear})',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColors.lightColor,
              ),
            ),
            Text(
              '${viewModel.selectedVehicle?.registrationNumber} ',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: AppColors.lightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
