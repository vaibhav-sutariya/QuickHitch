import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_tile.dart';
import 'package:quick_hitch/model/rides/booking_request/get_booking_request_model.dart';
import 'package:quick_hitch/view/ride/approved_booking_details/widgets/booking_details_widget.dart';
import 'package:quick_hitch/view/ride/approved_booking_details/widgets/ride_booking_details_widget.dart';

class ApprovedBookingDetailsScreen extends StatelessWidget {
  final BookingRequestData bookingData;

  const ApprovedBookingDetailsScreen({
    super.key,
    required this.bookingData,
  });

  @override
  Widget build(BuildContext context) {
    log('approved bookingData id: ${bookingData.id}');
    return Scaffold(
      appBar: CustomAppBar(title: 'Approved', isLeading: true, isAction: false),
      body: Column(
        children: [
          CustomDivider(),
          BookingDetailsWidget(ride: bookingData),
          BookingBDetailsWidget(data: bookingData),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding:
                  // const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.lightColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'You will receive a payout of \$${bookingData.totalAmount} after the trip is completed.',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightColor,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          SizedBox(height: 2),
          CustomTile(
            text: 'Invite Passengers',
            onPressed: () {},
          ),
          CustomTile(
            text: 'Message to ${bookingData.rider!.firstName}',
            onPressed: () {},
          ),
          CustomTile(
            text: 'Cancellation Policy',
            onPressed: () {},
          ),
          CustomTile(
            isLast: true,
            color: AppColors.redColor,
            text: 'Cancel Booking',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
