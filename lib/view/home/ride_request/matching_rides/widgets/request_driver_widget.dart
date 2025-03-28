import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/ride_request/get_ride_request_details_model.dart';

class RequestDriverWidget extends StatelessWidget {
  final MatchingRides ride;
  const RequestDriverWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                    '${ride.ride!.driver!.firstName!} ${ride.ride!.driver!.lastName!}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkColor,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${ride.ride!.driver!.cCount!.driverRide.toString()} driven',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightColor,
                        ),
                      ),
                      Text(
                        '  •  ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightColor,
                        ),
                      ),
                      Text(
                        ride.ride!.driver!.rating.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.star,
                        color: AppColors.yellowColor2,
                        size: 16,
                      ),
                    ],
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
