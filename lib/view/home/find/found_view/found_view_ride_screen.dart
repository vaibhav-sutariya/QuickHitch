import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';
import 'package:quick_hitch/view/home/find/found_view/widgets/date_price_widget.dart';

class FoundViewRideScreen extends StatelessWidget {
  final Rides ride;

  const FoundViewRideScreen({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'View Ride',
          isLeading: true,
          isAction: false,
        ),
        body: Column(
          children: [
            CustomDivider(),
            DatePriceWidget(ride: ride),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.radio_button_checked,
                        color: AppColors.lightColor),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
