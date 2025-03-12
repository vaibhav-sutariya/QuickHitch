import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/search_ride_view_model.dart';

// ignore: must_be_immutable
class DatePicker extends StatelessWidget {
  SearchRideViewModel viewModel;
  DatePicker({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Departure Date (Optional)',
            style: TextStyle(
              color: AppColors.darkColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => viewModel.selectDate(context),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      viewModel.formattedDate,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkColor,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.calendar_today,
                      color: Colors.grey, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
