import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/view_model/services/ride_toggle/three_ride_toggle_provider.dart';

class RideToggleWidget extends StatelessWidget {
  const RideToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rideToggleProvider = Provider.of<ThreeRideToggleProvider>(context);

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
                onTap: () => rideToggleProvider.toggleRide(RideStatus.active),
                child: Container(
                  height: 36.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        rideToggleProvider.selectedStatus == RideStatus.active
                            ? Colors.white
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'Active',
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
                    rideToggleProvider.toggleRide(RideStatus.completed),
                child: Container(
                  height: 36.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: rideToggleProvider.selectedStatus ==
                            RideStatus.completed
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'Past',
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
                    rideToggleProvider.toggleRide(RideStatus.cancelled),
                child: Container(
                  height: 36.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: rideToggleProvider.selectedStatus ==
                            RideStatus.cancelled
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'Cancelled',
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
