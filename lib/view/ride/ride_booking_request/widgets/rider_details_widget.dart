import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/rides/booking_request/get_booking_request_model.dart';

class RiderDetailsWidget extends StatelessWidget {
  final BookingRequestData request;
  const RiderDetailsWidget({super.key, required this.request});

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
                backgroundImage: NetworkImage(request.rider!.picture ?? ''),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        request.rider!.firstName!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkColor,
                        ),
                      ),
                      if (request.status == 'ACCEPTED' ||
                          request.status == 'REJECTED')
                        Text(
                          '  •  ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: request.status == 'ACCEPTED'
                                ? AppColors.greenColor
                                : AppColors.redColor,
                          ),
                        ),
                      Text(
                        request.status == 'ACCEPTED' ? 'Booked' : 'Rejected',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: request.status == 'ACCEPTED'
                              ? AppColors.greenColor
                              : AppColors.redColor,
                        ),
                      ),
                    ],
                  ),
                  if (request.status == 'PENDING')
                    Text(
                      DateFormat('dd/MM/yyyy | hh:mm a')
                          .format(DateTime.parse(request.ride!.departureDate!)),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightColor,
                      ),
                    ),
                  if (request.status == 'ACCEPTED' ||
                      request.status == 'REJECTED')
                    Text(
                      '${request.rider!.cCount!.driverRide} Rides Completed',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightColor,
                      ),
                    ),
                  // Text(
                  //   DateFormat('dd/MM/yyyy | hh:mm a')
                  //       .format(DateTime.parse(request.ride!.departureDate!)),
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.w400,
                  //     color: AppColors.darkColor,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          if (request.status == 'PENDING')
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${request.totalAmount}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkColor,
                      fontSize: 16),
                ),
                Text(
                  'Seats: ${request.noOfSeats}',
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
    );
  }
}
