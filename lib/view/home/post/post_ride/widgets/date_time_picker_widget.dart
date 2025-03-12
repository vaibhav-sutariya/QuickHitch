import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class DateTimePickerWidget extends StatelessWidget {
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final VoidCallback onDateTap;
  final VoidCallback onTimeTap;
  final bool isReturn;

  const DateTimePickerWidget({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateTap,
    required this.onTimeTap,
    required this.isReturn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPickerButton(
                label: isReturn ? "Returning" : "Departure Date",
                value: selectedDate != null
                    ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                    : "Select Date",
                icon: Icons.calendar_today_outlined,
                onTap: onDateTap,
              ),
              _buildPickerButton(
                label: "Time",
                value: selectedTime != null
                    ? selectedTime!.format(context)
                    : "Select Time",
                icon: Icons.access_time,
                onTap: onTimeTap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPickerButton({
    required String label,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12, // Matches the small label text
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor, // Adjust based on image color
          ),
        ),
        SizedBox(height: 4), // Adjusted spacing
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 156,
            height: 44,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: AppColors.borderColor, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightColor,
                  ),
                ),
                Icon(icon, size: 18, color: AppColors.lightColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
