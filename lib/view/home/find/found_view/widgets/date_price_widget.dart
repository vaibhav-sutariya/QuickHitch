import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';

class DatePriceWidget extends StatelessWidget {
  final Rides ride;
  const DatePriceWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              DateFormat('dd/MM/yyyy | hh:mm a')
                  .format(DateTime.parse(ride.ride!.departureDate!)),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.darkColor,
              )),
          Text('\$${ride.pricePerSeat.toString()}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.darkColor,
              )),
        ],
      ),
    );
  }
}
