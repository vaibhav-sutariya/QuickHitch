import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';

class DescWidget extends StatelessWidget {
  Rides ride;
  DescWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
              color: AppColors.darkColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10),
          Text(
            ride.description ?? '',
            style: TextStyle(
              color: AppColors.lightColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'No of Seats',
            style: TextStyle(
              color: AppColors.darkColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10),
          Text(
            ride.emptySeats.toString(),
            style: TextStyle(
              color: AppColors.lightColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
