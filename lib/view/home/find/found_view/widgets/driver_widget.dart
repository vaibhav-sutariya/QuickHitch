import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';

class DriverWidget extends StatelessWidget {
  final Rides ride;
  const DriverWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(ride.ride!.driver!.picture ?? ''),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${ride.ride!.driver!.firstName} ${ride.ride!.driver!.lastName}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${ride.ride!.driver!.cCount!.driverRide ?? 0} Rides Completed',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
