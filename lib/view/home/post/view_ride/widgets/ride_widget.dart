import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';

// ignore: must_be_immutable
class RideWidget extends StatelessWidget {
  PostRideViewModel viewModel;
  RideWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 4.0),
          detailsWidget(viewModel),
          SizedBox(height: 8.0),
          LocationWidget(
            viewModel: viewModel,
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget detailsWidget(PostRideViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${DateFormat('dd/MM/yyyy, EEEE').format(viewModel.selectedDate!)} | ${DateFormat('hh:mm a').format(DateTime(0, 1, 1, viewModel.selectedTime!.hour, viewModel.selectedTime!.minute))}',
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

// ignore: must_be_immutable
class LocationWidget extends StatelessWidget {
  PostRideViewModel viewModel;
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
                    viewModel.departureLocation.toString(),
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
                    viewModel.destinationLocation.toString(),
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
