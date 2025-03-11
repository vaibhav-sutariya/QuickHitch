import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';

class Stops extends StatelessWidget {
  final List<RideStops> stops;

  const Stops({
    super.key,
    required this.stops,
  });

  @override
  Widget build(BuildContext context) {
    List<RideStops> fullStops = [...stops];

    return ListView.builder(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: fullStops.length - 1,
      itemBuilder: (context, index) {
        return _buildStopItem(context, fullStops[index], index);
      },
    );
  }

  Widget _buildStopItem(BuildContext context, RideStops rides, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '\$${stops[index].pricePerSeat.toString()}',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Icon(Icons.radio_button_checked,
                          color: AppColors.greenColor2, size: 18.0),
                      SizedBox(height: 4.0),
                      Icon(Icons.more_vert, color: Colors.grey, size: 16.0),
                      SizedBox(height: 4.0),
                      Icon(Icons.radio_button_checked,
                          color: AppColors.redColor, size: 18.0),
                    ],
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rides.origin.toString(),
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        Divider(color: AppColors.borderColor, thickness: 1.0),
                        SizedBox(height: 4.0),
                        Text(
                          rides.destination.toString(),
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (index != stops.length - 2) SizedBox(height: 20.0),
            ],
          ),
        ),
        if (index != stops.length - 2) CustomDivider(),
      ],
    );
  }
}
