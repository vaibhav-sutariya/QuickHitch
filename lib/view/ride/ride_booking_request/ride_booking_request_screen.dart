import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view/ride/ride_booking_request/widgets/booking_req_toggle_widget.dart';
import 'package:quick_hitch/view_model/controller/rides/booking_request/get_ride_booking_request_view_model.dart';
import 'package:quick_hitch/view_model/services/ride_toggle/three_ride_toggle_provider.dart';

class RideBookingRequestScreen extends StatelessWidget {
  final String rideId;
  const RideBookingRequestScreen({super.key, required this.rideId});

  @override
  Widget build(BuildContext context) {
    log('rideId: $rideId');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                GetRideBookingRequestViewModel()..getRidesBookingReq(rideId)),
        ChangeNotifierProvider(
            create: (_) => ThreeRideBookingReqToggleProvider()),
      ],
      child: Consumer2<GetRideBookingRequestViewModel,
          ThreeRideBookingReqToggleProvider>(
        builder: (context, viewModel, toggleProvider, child) {
          final data = viewModel.bookingRequestModel;
          final selectedStatus = toggleProvider.selectedStatus;

          if (data == null || data.data == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final filteredRequests = data.data!
              .where((request) => request.status == selectedStatus)
              .toList();

          return Scaffold(
            appBar: CustomAppBar(
                title: 'Booking Request', isLeading: true, isAction: false),
            body: Column(
              children: [
                CustomDivider(),
                BookingReqToggleWidget(),
                Expanded(
                  child: filteredRequests.isEmpty
                      ? const Center(child: Text("No requests found"))
                      : ListView.builder(
                          itemCount: filteredRequests.length,
                          itemBuilder: (context, index) {
                            final request = filteredRequests[index];
                            return ListTile(
                              title: Text(request.origin.toString()),
                              subtitle: Text(request.destination.toString()),
                              trailing: Text(request.status.toString(),
                                  style: TextStyle(
                                      color: request.status == 'PENDING'
                                          ? Colors.orange
                                          : request.status == 'ACCEPTED'
                                              ? Colors.green
                                              : Colors.red)),
                            );
                          },
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
