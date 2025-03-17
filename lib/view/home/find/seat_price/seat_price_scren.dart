import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';
import 'package:quick_hitch/view/home/find/seat_price/widgets/billing_widget.dart';
import 'package:quick_hitch/view/home/find/seat_price/widgets/custom_counter_widget.dart';
import 'package:quick_hitch/view/home/find/seat_price/widgets/promocode_widget.dart';

class SeatPriceScren extends StatelessWidget {
  final Rides ride;
  const SeatPriceScren({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    log('SeatPriceScren: ${ride.origin.toString()}');

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Seat and Pricing',
        isLeading: true,
        isAction: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDivider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Seat and Pricing'),
                        CustomCounterWidget(),
                      ],
                    ),
                  ),
                  CustomDivider(),
                  BillingWidget(ride: ride),
                  CustomDivider(),
                  PromocodeWidget(),
                ],
              ),
            ),
          ),
          // Button fixed at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomElevatedButton(text: 'Continue', press: () {}),
          ),
        ],
      ),
    );
  }
}
