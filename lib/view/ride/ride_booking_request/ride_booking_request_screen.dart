import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/small_button_widget.dart';
import 'package:quick_hitch/view/ride/ride_booking_request/widgets/booking_req_toggle_widget.dart';
import 'package:quick_hitch/view/ride/ride_booking_request/widgets/req_ride_widget.dart';
import 'package:quick_hitch/view/ride/ride_booking_request/widgets/rider_details_widget.dart';
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
          log('selectedStatus: $selectedStatus');

          if (viewModel.getBookingRequestLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (data == null || data.data == null) {
            return const Scaffold(
              body: Center(child: Text("No booking requests found")),
            );
          }

          final filteredRequests = data.data!
              .where((request) =>
                  request.status.toString().toUpperCase() ==
                  selectedStatus.name.toUpperCase())
              .toList();

          return Scaffold(
            appBar: CustomAppBar(
                title: 'Booking Request', isLeading: true, isAction: false),
            body: Column(
              children: [
                CustomDivider(),
                BookingReqToggleWidget(
                  bookingRequestData: filteredRequests.length.toString(),
                ),
                Expanded(
                  child: filteredRequests.isEmpty
                      ? const Center(child: Text("No requests found"))
                      : ListView.builder(
                          itemCount: filteredRequests.length,
                          itemBuilder: (context, index) {
                            final request = filteredRequests[index];
                            return Column(
                              children: [
                                RiderDetailsWidget(request: request),
                                SizedBox(height: 5.0),
                                ReqRideWidget(ride: request),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    spacing: 32,
                                    children: [
                                      Expanded(
                                        child: SmallButtonWidget(
                                          color: AppColors.greenColor2,
                                          text: 'Accept',
                                          onPressed: () {},
                                          isLoading: viewModel
                                              .getBookingRequestLoading,
                                          icon: Icons.check_circle_outlined,
                                        ),
                                      ),
                                      Expanded(
                                        child: SmallButtonWidget(
                                          color: AppColors.redColor,
                                          text: 'Decline',
                                          onPressed: () {},
                                          isLoading: viewModel
                                              .getBookingRequestLoading,
                                          icon: Icons.cancel_outlined,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomDivider(),
                              ],
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
