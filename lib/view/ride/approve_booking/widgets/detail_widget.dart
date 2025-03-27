import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/rides/booking_request/get_booking_request_model.dart';

class DetailWidget extends StatelessWidget {
  final BookingRequestData bookingData;
  const DetailWidget({super.key, required this.bookingData});

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
                backgroundImage: NetworkImage(bookingData.rider!.picture ?? ''),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        bookingData.rider!.firstName!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy | hh:mm a').format(
                        DateTime.parse(bookingData.ride!.departureDate!)),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${bookingData.totalAmount}',
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkColor,
                    fontSize: 16),
              ),
              Text(
                '${bookingData.noOfSeats} Seats',
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
