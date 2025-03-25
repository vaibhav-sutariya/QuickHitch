import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/bookings/refund_model.dart';

class RRideDetailsWidget extends StatelessWidget {
  final RefundModel ride; // Assuming RideModel contains the required data.

  const RRideDetailsWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.redColor.withOpacity(0.1),
          border: Border(
            bottom: BorderSide(color: AppColors.redColor, width: 1.0),
          ) // Light blue background
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'date',
                // DateFormat('dd/MM/yyyy | hh:mm a')
                //     .format(DateTime.parse(ride.data.de)),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${ride.data!.originalAmount}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkColor,
                    ),
                  ),
                  Text(
                    "${ride.data!.noOfSeats} Seats",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                          ride.data!.origin.toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.lightColor,
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
                          ride.data!.destination.toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.lightColor,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
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
