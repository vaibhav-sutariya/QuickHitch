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
import 'package:quick_hitch/view_model/controller/rides/booking_request/confirm_booking_view_model.dart';
import 'package:quick_hitch/view_model/controller/rides/booking_request/get_ride_booking_request_view_model.dart';
import 'package:quick_hitch/view_model/services/ride_toggle/three_ride_toggle_provider.dart';

class RideBookingRequestScreen extends StatelessWidget {
  final String rideId;

  const RideBookingRequestScreen({super.key, required this.rideId});

  @override
  Widget build(BuildContext context) {
    log('Ride ID: $rideId');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetRideBookingRequestViewModel(
            Provider.of<ThreeRideBookingReqToggleProvider>(context,
                listen: false),
          )..getRidesBookingReq(rideId),
        ),
        ChangeNotifierProvider(
          create: (_) => ThreeRideBookingReqToggleProvider(),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Booking Request',
          isLeading: true,
          isAction: false,
        ),
        body: Column(
          children: [
            const CustomDivider(),

            Consumer<ThreeRideBookingReqToggleProvider>(
              builder: (context, toggleProvider, child) {
                return BookingReqToggleWidget(
                  bookingRequestData: '0',
                );
              },
            ),

            /// Only this part should refresh
            Expanded(
              child: Consumer2<GetRideBookingRequestViewModel,
                  ThreeRideBookingReqToggleProvider>(
                builder: (context, viewModel, toggleProvider, child) {
                  if (viewModel.getBookingRequestLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final data = viewModel.bookingRequestModel;
                  if (data == null || data.data == null || data.data!.isEmpty) {
                    return const Center(
                        child: Text("No booking requests found"));
                  }

                  final selectedStatus = toggleProvider.selectedStatus;
                  log('Selected Status: $selectedStatus');

                  final filteredRequests = data.data!
                      .where((request) =>
                          request.status.toString().toUpperCase() ==
                          selectedStatus.name.toUpperCase())
                      .toList();

                  return RefreshIndicator(
                    onRefresh: () async {
                      viewModel.refreshBookingRequests(selectedStatus);
                    },
                    child: filteredRequests.isEmpty
                        ? const Center(child: Text("No requests found"))
                        : ListView.separated(
                            itemCount: filteredRequests.length,
                            separatorBuilder: (context, index) =>
                                const CustomDivider(),
                            itemBuilder: (context, index) {
                              final request = filteredRequests[index];
                              return Column(
                                children: [
                                  RiderDetailsWidget(request: request),
                                  const SizedBox(height: 5.0),
                                  ReqRideWidget(ride: request),
                                  if (request.status == 'PENDING')
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 10),
                                      child: Consumer<ConfirmBookingViewModel>(
                                        builder: (context, value, child) {
                                          return Row(
                                            children: [
                                              Expanded(
                                                child: SmallButtonWidget(
                                                  color: AppColors.greenColor2,
                                                  text: 'Accept',
                                                  onPressed: () {
                                                    value.confirmBooking(
                                                        request.id!);
                                                  },
                                                  isLoading: value
                                                      .getConfrimBookingLoading,
                                                  icon: Icons
                                                      .check_circle_outlined,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: SmallButtonWidget(
                                                  color: AppColors.redColor,
                                                  text: 'Decline',
                                                  onPressed: () {
                                                    value.rejectBooking(
                                                        request.id!);
                                                  },
                                                  isLoading: value
                                                      .getRejectBookingLoading,
                                                  icon: Icons.cancel_outlined,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
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
