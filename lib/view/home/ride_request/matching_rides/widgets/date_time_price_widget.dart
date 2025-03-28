import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/ride_request/get_ride_request_details_model.dart';

class DateTimePriceWidget extends StatelessWidget {
  final MatchingRides ride;
  const DateTimePriceWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
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
            ),
          ),
          RichText(
            text: TextSpan(
              style:
                  TextStyle(fontFamily: GoogleFonts.josefinSans().fontFamily),
              children: [
                TextSpan(
                  text: '${ride.ride!.emptySeats} Seats left | ',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400, // Make seat count bold
                    color: AppColors.lightColor,
                  ),
                ),
                TextSpan(
                  text: '\$${ride.pricePerSeat}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400, // Make price bold
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
