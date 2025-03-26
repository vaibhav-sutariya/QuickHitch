import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/small_button_widget.dart';
import 'package:quick_hitch/model/bookings/booking_details_model.dart';
import 'package:quick_hitch/view/home/find/cancel_booking/widgets/drive_widget.dart';
import 'package:quick_hitch/view_model/controller/bookings/cancel_booking_view_model.dart';

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
                Consumer<CancelBookingViewModel>(
                  builder: (context, viewModel, child) {
                    return Expanded(
                      child: SmallButtonWidget(
                        color: AppColors.greenColor2,
                        text: 'Yes',
                        onPressed: () {
                          viewModel.cancelBooking(context, booking.id!);
                        },
                        isLoading: viewModel.updateCancelBookingLoading,
                        icon: Icons.check_circle_outline,
                      ),
                    );
                  },
                ),
                Expanded(
                  child: SmallButtonWidget(
                    color: AppColors.redColor,
                    text: 'No',
                    onPressed: () => Navigator.pop(context),
                    icon: Icons.cancel_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
