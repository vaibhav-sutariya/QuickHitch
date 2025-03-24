import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/model/bookings/booking_details_model.dart';
import 'package:quick_hitch/view/home/find/cancel_booking/widgets/drive_widget.dart';

class CancelBookingScreen extends StatelessWidget {
  final BookingData booking;
  const CancelBookingScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    log('Cancel Booking Screen ${booking.id}');
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Cancel booking', isLeading: true, isAction: false),
      body: Column(
        children: [
          CustomDivider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Are you sure you want to cancel your booking request?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.darkColor,
              ),
            ),
          ),
          DriveWidget(data: booking),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'If you cancel your booking request, the authorization of \$${booking.refundAmount} will be released from your card.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightColor,
                  ),
                ),
                Text(
                  'Note that you’ll still be able to request to book again.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              spacing: 32,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      iconColor: AppColors.whiteColor,
                      backgroundColor: AppColors.greenColor2,
                      // minimumSize: Size(152, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    label: Text(
                      'Yes',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    icon: Icon(Icons.check_circle_outline),
                    iconAlignment: IconAlignment.end,
                  ),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      iconColor: AppColors.whiteColor,
                      backgroundColor: AppColors.redColor,
                      // minimumSize: Size(152, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    label: Text(
                      'No',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    icon: Icon(Icons.cancel_outlined),
                    iconAlignment: IconAlignment.end,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
