import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';

class LocationDetailsWidget extends StatelessWidget {
  Rides ride;
  LocationDetailsWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 4.0),
          detailsWidget(ride),
          SizedBox(height: 8.0),
          LocationWidget(
            viewModel: ride,
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget detailsWidget(Rides viewModel) {
    final dateFormat = DateFormat('dd/MM/yyyy, EEEE');
    final timeFormat = DateFormat('hh:mm a');
    final departureDate = ride.departureDate != null
        ? DateTime.parse(ride.departureDate!)
        : DateTime.now();
    final formattedDate = dateFormat.format(departureDate);
    final formattedTime = timeFormat.format(departureDate);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$formattedDate | $formattedTime',
          style: TextStyle(
            color: AppColors.darkColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          '\$${viewModel.pricePerSeat}',
          style: TextStyle(
            color: AppColors.darkColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class LocationWidget extends StatelessWidget {
  Rides viewModel;
  LocationWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(
                  Icons.radio_button_checked,
                  color: AppColors.greenColor2,
                  size: 18.0,
                ),
                SizedBox(height: 4.0),
                Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                  size: 16.0,
                ),
                SizedBox(height: 4.0),
                Icon(
                  Icons.radio_button_checked,
                  color: AppColors.redColor,
                  size: 18.0,
                ),
              ],
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.origin.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Divider(
                    color: AppColors.borderColor,
                    thickness: 1.0,
                    height: 16.0,
                  ),
                  Text(
                    viewModel.destination.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
