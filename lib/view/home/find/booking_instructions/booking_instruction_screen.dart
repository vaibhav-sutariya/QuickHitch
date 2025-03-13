import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/assets/image_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';
import 'package:quick_hitch/view/home/find/booking_instructions/widgets/custom_inst.dart';
import 'package:quick_hitch/view/home/find/booking_instructions/widgets/custom_switch_widget.dart';

class BookingInstructionScreen extends StatelessWidget {
  final Rides ride;
  const BookingInstructionScreen({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    log('BookingInstructionScreen: ${ride.origin.toString()}');
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booking Instruction',
        isLeading: true,
        isAction: false,
      ),
      body: Column(
        children: [
          CustomDivider(),
          CustomInst(
            colors: AppColors.yellowColor2,
            img: ImageAssets.instOne,
            title: 'This is not a taxi service',
            desc:
                'Meet your driver at the pickup location. \n\nSit in the front seat and keep conversations minimal.',
          ),
          CustomInst(
            colors: AppColors.greenColor,
            img: ImageAssets.instTwo,
            title: 'Cash payments are not accepted',
            desc:
                'All payments are handled online, and drivers are paid after the trip.',
          ),
          CustomInst(
            colors: AppColors.primaryColor,
            img: ImageAssets.instThree,
            title: 'Punctuality is important',
            desc: 'Drivers leave on time, so ensure you arrive early.',
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                      'I understand that violating these rules may lead to account suspension.'),
                ),
                CustomSwitchWidget(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomElevatedButton(text: 'Book Ride ', press: () {}),
          ),
        ],
      ),
    );
  }
}
