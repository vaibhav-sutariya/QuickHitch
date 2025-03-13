import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';

class VehWidget extends StatelessWidget {
  final Rides ride;
  const VehWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vehicle',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '${ride.ride!.vehicle!.make!.name!}, ${ride.ride!.vehicle!.model} (${ride.ride!.vehicle!.year})',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.lightColor,
            ),
          ),
        ],
      ),
    );
  }
}
