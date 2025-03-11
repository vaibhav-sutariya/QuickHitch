import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';

class VehicleWidget extends StatelessWidget {
  Rides ride;
  VehicleWidget({
    super.key,
    required this.ride,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vehicle',
            style: TextStyle(
              color: AppColors.darkColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          Text(
            '${ride.vehicle!.make!.name.toString()}, ${ride.vehicle!.model.toString()}',
            style: TextStyle(
              color: AppColors.lightColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
