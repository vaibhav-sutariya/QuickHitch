import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view/home/ride_request/matching_rides/widgets/date_time_price_widget.dart';
import 'package:quick_hitch/view/home/ride_request/matching_rides/widgets/request_driver_widget.dart';
import 'package:quick_hitch/view/home/ride_request/matching_rides/widgets/requet_ride_details_widget.dart';
import 'package:quick_hitch/view_model/controller/home/ride_request/get_ride_request_details_view_model.dart';

class MatchingRidesScreen extends StatelessWidget {
  final String requestId;

  const MatchingRidesScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    log('Request ID: $requestId');
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Matching Rides', isLeading: true, isAction: false),
      body: ChangeNotifierProvider(
        create: (_) =>
            GetRideRequestDetailsViewModel()..getRideRequestDetails(requestId),
        child: Column(
          children: [
            CustomDivider(),
            Expanded(
              // ✅ Wrap ListView.builder inside Expanded
              child: Consumer<GetRideRequestDetailsViewModel>(
                builder: (context, model, child) {
                  if (model.getRideRequestDetailsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (model.rideRequestDetails == null ||
                      model.rideRequestDetails!.data!.matchingRides!.isEmpty) {
                    return const Center(child: Text('No matching rides found'));
                  }

                  return ListView.builder(
                    itemCount:
                        model.rideRequestDetails!.data!.matchingRides!.length,
                    itemBuilder: (context, index) {
                      final ride =
                          model.rideRequestDetails!.data!.matchingRides![index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RequestDriverWidget(ride: ride),
                          DateTimePriceWidget(ride: ride),
                          RequetRideDetailsWidget(ride: ride),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              '${ride.ride!.vehicle!.make!.name!} ${ride.ride!.vehicle!.model!} ${ride.ride!.vehicle!.year!}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          CustomDivider(),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
