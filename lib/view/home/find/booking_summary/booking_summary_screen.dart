import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/model/home/card_model.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';

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
    log('booking Summary: ${card.id}');
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Booking Summary', isLeading: true, isAction: false),
      body: Column(
        children: [
          CustomDivider(),
        ],
      ),
    );
  }
}
