import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/ride_request/create_request_view_model.dart';

class DepartureDatePicker extends StatelessWidget {
  final CreateRequestViewModel viewModel;
  const DepartureDatePicker({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Departure Date",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.darkColor,
            ),
          ),
          GestureDetector(
            onTap: () => viewModel.pickDate(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    viewModel.selectedDate == null
                        ? "Select Date"
                        : "${viewModel.selectedDate!.day}/${viewModel.selectedDate!.month}/${viewModel.selectedDate!.year}",
                    style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkColor,
                        fontWeight: FontWeight.w400),
                  ),
                  const Icon(Icons.calendar_today,
                      color: AppColors.mediumColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
