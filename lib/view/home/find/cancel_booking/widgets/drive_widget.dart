import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/bookings/booking_details_model.dart';

class DriveWidget extends StatelessWidget {
  final BookingData data;
  const DriveWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(data.ride!.driver!.picture ?? ''),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: GoogleFonts.josefinSans().fontFamily,
                  ),
                  children: [
                    // Driver's Name (Bold)
                    TextSpan(
                      text:
                          '${data.ride!.driver!.firstName} ${data.ride!.driver!.lastName}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkColor,
                      ),
                    ),
                    // Dot separator
                    const TextSpan(
                      text: ' • ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkColor,
                      ),
                    ),
                    // Price (Bold)
                    TextSpan(
                      text: '\$${data.totalAmount!.toDouble()}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkColor,
                      ),
                    ),
                    // Seats (Normal)
                    TextSpan(
                      text: ' for ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkColor,
                      ),
                    ),
                    TextSpan(
                      text: '${data.noOfSeats} Seats',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkColor,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    '${data.ride!.origin!.split(',')[0]} to ${data.ride!.destination!.split(',')[0]} | ${DateFormat('dd/MM/yyyy').format(DateTime.parse(data.ride!.departureDate!))}',
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
