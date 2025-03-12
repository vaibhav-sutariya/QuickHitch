import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/view_model/services/ride_toggle/two_ride_toggle_provider.dart';

class SearchToggle extends StatelessWidget {
  const SearchToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final rideToggleProvider = Provider.of<TwoRideToggleProvider>(context);

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
                onTap: () => rideToggleProvider.toggleRide(true),
                child: Container(
                  height: 36.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: rideToggleProvider.isUpcomingSelected
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'Rides',
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
                onTap: () => rideToggleProvider.toggleRide(false),
                child: Container(
                  height: 36.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: rideToggleProvider.isUpcomingSelected
                        ? Colors.transparent
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'Requests',
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
