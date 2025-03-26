import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/view_model/services/ride_toggle/three_ride_toggle_provider.dart';

class BookingReqToggleWidget extends StatelessWidget {
  const BookingReqToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rideToggleProvider =
        Provider.of<ThreeRideBookingReqToggleProvider>(context);

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
                onTap: () =>
                    rideToggleProvider.toggleRide(RidebookingStatus.accepted),
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
                onTap: () =>
                    rideToggleProvider.toggleRide(RidebookingStatus.pending),
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
                  child: const Text(
                    'Pending',
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
                onTap: () =>
                    rideToggleProvider.toggleRide(RidebookingStatus.rejected),
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
