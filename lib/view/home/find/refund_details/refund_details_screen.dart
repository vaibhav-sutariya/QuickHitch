import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view/home/find/refund_details/widgets/rb_details_widget.dart';
import 'package:quick_hitch/view/home/find/refund_details/widgets/rbooking_ride_details_widget.dart';
import 'package:quick_hitch/view/home/find/refund_details/widgets/rcustom_tile.dart';
import 'package:quick_hitch/view_model/controller/bookings/cancel_booking_view_model.dart';

class RefundDetailsScreen extends StatelessWidget {
  final String bookingId;

  const RefundDetailsScreen({
    super.key,
    required this.bookingId,
  });

  @override
  Widget build(BuildContext context) {
    log('refund Details Screen $bookingId');
    return Consumer<CancelBookingViewModel>(
      builder: (context, viewModel, child) {
        // log('Booking Details Screen Consumer ${viewModel.refundDetailsModel!.data!.origin}');
        if (viewModel.updateCancelBookingLoading) {
          return Scaffold(
            appBar:
                CustomAppBar(title: 'Refund', isLeading: true, isAction: false),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar:
              CustomAppBar(title: 'Refund', isLeading: true, isAction: false),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDivider(),
              RRideDetailsWidget(ride: viewModel.refundDetailsModel!),
              RBDetailsWidget(data: viewModel.refundDetailsModel!),
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
                    'An authorization of \$${viewModel.refundDetailsModel!.data!.totalAmount} has been made on your card.',
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
              RCustomTile(
                text: 'Message to driver',
                onPressed: () {},
              ),
              RCustomTile(
                text: 'Cancellation Policy',
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
