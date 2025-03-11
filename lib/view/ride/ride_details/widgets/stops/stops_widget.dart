import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';
import 'package:quick_hitch/view/ride/ride_details/widgets/stops/stops.dart';

class YourStop extends StatefulWidget {
  final List<RideStops> rideStops; // Change from Rides to List<RideStop>

  const YourStop({
    super.key,
    required this.rideStops, // Expect a list
  });

  @override
  State<YourStop> createState() => _YourStopState();
}

class _YourStopState extends State<YourStop> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Stops',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.arrow_forward_ios,
                  color: AppColors.darkColor,
                  size: 18.0,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            child: widget.rideStops.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'No stops added yet',
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                : Stops(
                    stops: widget.rideStops,
                  ),
          ),
      ],
    );
  }
}
