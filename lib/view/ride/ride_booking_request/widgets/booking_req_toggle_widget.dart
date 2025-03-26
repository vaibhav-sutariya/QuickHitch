import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/rides/booking_request/get_ride_booking_request_view_model.dart';
import 'package:quick_hitch/view_model/services/ride_toggle/three_ride_toggle_provider.dart';

class BookingReqToggleWidget extends StatelessWidget {
  final String bookingRequestData;
  const BookingReqToggleWidget({super.key, required this.bookingRequestData});

  @override
  Widget build(BuildContext context) {
    final rideToggleProvider =
        Provider.of<ThreeRideBookingReqToggleProvider>(context);
    final viewModel = Provider.of<GetRideBookingRequestViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  rideToggleProvider.toggleRide(RidebookingStatus.accepted);
                  viewModel.getRidesBookingReq(viewModel.currentRideId!,
                      status: RidebookingStatus.accepted.name.toUpperCase());
                },
                child: Container(
                  height: 36.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: rideToggleProvider.selectedStatus ==
                            RidebookingStatus.accepted
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'Accepted',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  rideToggleProvider.toggleRide(RidebookingStatus.pending);
                  viewModel.getRidesBookingReq(viewModel.currentRideId!,
                      status: RidebookingStatus.pending.name.toUpperCase());
                },
                child: Container(
                  height: 36.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: rideToggleProvider.selectedStatus ==
                            RidebookingStatus.pending
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pending',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          bookingRequestData.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  rideToggleProvider.toggleRide(RidebookingStatus.rejected);
                  viewModel.getRidesBookingReq(viewModel.currentRideId!,
                      status: RidebookingStatus.rejected.name.toUpperCase());
                },
                child: Container(
                  height: 36.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: rideToggleProvider.selectedStatus ==
                            RidebookingStatus.rejected
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'Rejected',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
