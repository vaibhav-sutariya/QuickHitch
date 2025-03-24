import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/home/card_model.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';
import 'package:quick_hitch/view/home/find/booking_summary/widgets/book_ride_details_widget.dart';
import 'package:quick_hitch/view/home/find/booking_summary/widgets/sel_card_widget.dart';
import 'package:quick_hitch/view_model/controller/home/booking_view_model.dart';

class BookingSummaryScreen extends StatelessWidget {
  final Rides ride;
  final CardDatas card;

  const BookingSummaryScreen({
    super.key,
    required this.ride,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    log('Booking Summary: ${ride.origin.toString()}');
    log('Booking id: ${ride.id.toString()}');
    log('Booking Summary: ${card.id}');

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booking Summary',
        isLeading: true,
        isAction: false,
      ),
      body: Column(
        children: [
          /// Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomDivider(),
                  BookRideDetailsWidget(ride: ride),
                  CustomDivider(),
                  SelCardWidget(card: card),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.bgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your booking request has been sent to driver',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Consumer<BookingViewModel>(
                            builder: (context, viewModel, child) {
                              final price = (ride.pricePerSeat ?? 0) *
                                  (viewModel.counter);
                              final total = price + 4;
                              return Text(
                                'Your card will be charged \$$total when your request is accepted by the driver.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightColor,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomDivider(),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, RoutesName.paymetPoliciesScreen),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Our Payment Policies',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkColor,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: AppColors.darkColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Fixed Button at the Bottom
          Consumer<BookingViewModel>(
            builder: (context, viewModel, child) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomElevatedButton(
                    text: 'Confirm Request to Book',
                    press: () {
                      log('card token: ${card.id}');
                      viewModel.createBookings(context, ride.id.toString());
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
