import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view_model/controller/bookings/get_booking_details_view_model.dart';

class BookingDetailsScreen extends StatelessWidget {
  final String bookingId;

  const BookingDetailsScreen({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context) {
    log('Booking Details Screen $bookingId');
    return ChangeNotifierProvider(
      create: (context) =>
          GetBookingDetailsViewModel()..getBookingDetails(bookingId),
      child: Consumer<GetBookingDetailsViewModel>(
        builder: (context, viewModel, child) {
          log('Booking Details Screen Consumer ${viewModel.bookingDetailsModel?.data!.origin}');
          return Scaffold(
            appBar: CustomAppBar(
                title: 'Booking', isLeading: true, isAction: false),
            body: Column(
              children: [
                CustomDivider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [Container()],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
