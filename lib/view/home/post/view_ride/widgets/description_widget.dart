import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';

// ignore: must_be_immutable
class DescriptionWidget extends StatelessWidget {
  PostRideViewModel viewModel;
  DescriptionWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              viewModel.description.toString(),
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: AppColors.lightColor,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'No of seats',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '${viewModel.selectedSeat} seats',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: AppColors.lightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
