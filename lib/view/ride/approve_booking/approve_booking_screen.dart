import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/small_button_widget.dart';
import 'package:quick_hitch/model/rides/booking_request/get_booking_request_model.dart';
import 'package:quick_hitch/view/ride/approve_booking/widgets/detail_widget.dart';
import 'package:quick_hitch/view_model/controller/rides/booking_request/confirm_booking_view_model.dart';

class ApproveBookingScreen extends StatelessWidget {
  final BookingRequestData bookingData;
  const ApproveBookingScreen({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    log('bookingData id: ${bookingData.id}');
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Approve a booking', isLeading: true, isAction: false),
      body: Column(
        children: [
          CustomDivider(),
          DetailWidget(bookingData: bookingData),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are you sure you’d like to approve Owen?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkColor,
                  ),
                ),
                Text(
                  'Passengers rely on you...',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkColor,
                  ),
                ),
                Text(
                  'Only approve Owen if you’re 100% sure this trip will take place. ',
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Consumer<ConfirmBookingViewModel>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: SmallButtonWidget(
                        color: AppColors.greenColor2,
                        text: 'Accept',
                        onPressed: () {
                          value.confirmBooking(bookingData.id!, context);
                        },
                        isLoading: value.getConfrimBookingLoading,
                        icon: Icons.check_circle_outlined,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SmallButtonWidget(
                        color: AppColors.redColor,
                        text: 'Decline',
                        onPressed: () {
                          value.rejectBooking(bookingData.id!, context);
                        },
                        isLoading: value.getRejectBookingLoading,
                        icon: Icons.cancel_outlined,
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
