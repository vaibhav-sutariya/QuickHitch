import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';

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
          CustomDivider(),
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}
