import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/view/home/find/booking_details/widgets/b_details_widget.dart';
import 'package:quick_hitch/view/home/find/booking_details/widgets/booking_ride_details_widget.dart';
import 'package:quick_hitch/view/home/find/booking_details/widgets/custom_tile.dart';
import 'package:quick_hitch/view_model/controller/bookings/get_booking_details_view_model.dart';

class BookingDetailsScreen extends StatelessWidget {
  final String bookingId;

  const BookingDetailsScreen({
    super.key,
    required this.bookingId,
  });

  @override
  Widget build(BuildContext context) {
    log('Booking Details Screen $bookingId');
    return ChangeNotifierProvider(
      create: (context) =>
          GetBookingDetailsViewModel()..getBookingDetails(bookingId),
      child: Consumer<GetBookingDetailsViewModel>(
        builder: (context, viewModel, child) {
          log('Booking Details Screen Consumer ${viewModel.bookingDetailsModel?.data!.origin}');
          final data = viewModel.bookingDetailsModel?.data;
          if (viewModel.getBookingDetailsModelLoadingLoading) {
            return Scaffold(
              appBar: CustomAppBar(
                  title: 'Booking', isLeading: true, isAction: false),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: CustomAppBar(
                title: 'Booking', isLeading: true, isAction: false),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDivider(),
                RideDetailsWidget(ride: data!),
                BDetailsWidget(data: data),
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
                      'Payouts are processed within 5-7 business days following Trip completion',
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
                  text: 'Message to ${data.ride!.driver!.firstName}',
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
                  onPressed: () => Navigator.pushNamed(
                    context,
                    RoutesName.cancelBookingScreen,
                    arguments: data,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
