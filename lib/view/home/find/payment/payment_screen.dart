import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';

class PaymentScreen extends StatelessWidget {
  final Rides ride;
  const PaymentScreen({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    log('PaymentScreen: ${ride.origin.toString()}');
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment',
        isLeading: true,
        isAction: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDivider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Select card for payment'),
          ),
          CustomDivider(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton.icon(
                onPressed: () => Navigator.pushNamed(
                  context,
                  RoutesName.addNewCardScreen,
                ),
                label: Text(
                  'Add new card',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                icon: Icon(
                  Icons.add,
                  color: AppColors.darkColor,
                  size: 14,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          CustomDivider(),
        ],
      ),
    );
  }
}
