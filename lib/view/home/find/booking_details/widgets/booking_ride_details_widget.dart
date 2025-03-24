import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/bookings/booking_details_model.dart';

class RideDetailsWidget extends StatelessWidget {
  final BookingData ride; // Assuming RideModel contains the required data.

  const RideDetailsWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          border: Border(
            bottom: BorderSide(color: AppColors.primaryColor, width: 1.0),
          ) // Light blue background
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('dd/MM/yyyy | hh:mm a')
                    .format(DateTime.parse(ride.ride!.departureDate!)),
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
                    "\$${ride.ride?.pricePerSeat}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkColor,
                    ),
                  ),
                  Text(
                    "${ride.noOfSeats} Seats",
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
                          ride.ride!.origin.toString(),
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
                          ride.ride!.destination.toString(),
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
