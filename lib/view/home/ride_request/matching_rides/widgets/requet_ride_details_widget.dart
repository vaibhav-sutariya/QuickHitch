import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/ride_request/get_ride_request_details_model.dart';

class RequetRideDetailsWidget extends StatelessWidget {
  final MatchingRides ride;
  const RequetRideDetailsWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(
                Icons.radio_button_checked,
                color: AppColors.greenColor2,
                size: 18.0,
              ),
              SizedBox(height: 4.0),
              Icon(
                Icons.more_vert,
                color: Colors.grey,
                size: 16.0,
              ),
              SizedBox(height: 4.0),
              Icon(
                Icons.radio_button_checked,
                color: AppColors.redColor,
                size: 18.0,
              ),
            ],
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ride.origin.toString(),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Divider(
                  color: AppColors.borderColor,
                  thickness: 1.0,
                  height: 16.0,
                ),
                Text(
                  ride.destination.toString(),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
