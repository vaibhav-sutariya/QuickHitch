import 'package:flutter/material.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';

class DesWidget extends StatelessWidget {
  final Rides ride;
  const DesWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trip Description',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            ride.ride.toString(),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
