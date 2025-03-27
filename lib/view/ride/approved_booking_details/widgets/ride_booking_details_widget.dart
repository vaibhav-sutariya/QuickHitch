import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/rides/booking_request/get_booking_request_model.dart';

class BookingBDetailsWidget extends StatelessWidget {
  final BookingRequestData data;
  const BookingBDetailsWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'Booking Details',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.darkColor,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${data.ride!.pricePerSeat.toString()} x ${data.noOfSeats} seats',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightColor,
                ),
              ),
              Text(
                '\$${data.originalAmount}.00',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payout fee',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightColor,
                ),
              ),
              Text(
                '\$${(data.platformFee ?? 0) % 1 == 0 ? data.platformFee?.toInt() : data.platformFee?.toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payouts',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkColor,
                ),
              ),
              Text(
                '\$${(data.totalAmount ?? 0) % 1 == 0 ? data.totalAmount?.toInt() : data.totalAmount?.toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
