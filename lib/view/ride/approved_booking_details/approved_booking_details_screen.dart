import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/model/rides/booking_request/get_booking_request_model.dart';

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
      appBar: CustomAppBar(title: 'Approve', isLeading: true, isAction: false),
      body: Column(
        children: [
          CustomDivider(),
        ],
      ),
    );
  }
}
