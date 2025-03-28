import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
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
          create: (_) => GetRideRequestDetailsViewModel()
            ..getRideRequestDetails(requestId),
          child: Consumer<GetRideRequestDetailsViewModel>(
            builder: (context, model, child) {
              if (model.getRideRequestDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (model.rideRequestDetails == null) {
                return const Center(child: Text('No matching rides found'));
              }

              return ListView.builder(
                itemCount:
                    model.rideRequestDetails!.data!.matchingRides!.length,
                itemBuilder: (context, index) {
                  final ride =
                      model.rideRequestDetails!.data!.matchingRides![index];
                  return ListTile(
                    title: Text(ride.origin!),
                    subtitle: Text(ride.destination!),
                    trailing:
                        Text(ride.ride!.driver!.cCount!.driverRide.toString()),
                  );
                },
              );
            },
          )),
    );
  }
}
