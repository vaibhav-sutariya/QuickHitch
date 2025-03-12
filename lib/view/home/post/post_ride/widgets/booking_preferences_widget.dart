import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';

class BookingPreferenceWidget extends StatelessWidget {
  const BookingPreferenceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostRideViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Booking Preference",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
            ),
            const SizedBox(height: 12),

            // Request to Book Option
            _buildOption(
              context,
              viewModel,
              title: "Request to Book",
              subtitle:
                  "You approve or decline passengers manually\nYou control who gets in your car",
              icon: Icons.check_box,
              preference: BookingPreference.requestToBook,
              isSelected: viewModel.selectedPreference ==
                  BookingPreference.requestToBook,
            ),
            const SizedBox(height: 12),

            // Instant Booking Option
            _buildOption(
              context,
              viewModel,
              title: "Instant booking",
              subtitle:
                  "Rider can directly book the seat without taking your approval.",
              icon: Icons.bolt,
              preference: BookingPreference.instantBooking,
              isSelected: viewModel.selectedPreference ==
                  BookingPreference.instantBooking,
            ),
          ],
        );
      },
    );
  }

  Widget _buildOption(
    BuildContext context,
    PostRideViewModel viewModel, {
    required String title,
    required String subtitle,
    required IconData icon,
    required BookingPreference preference,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => viewModel.setPreference(preference),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.borderColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.borderColor,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: AppColors.darkColor,
                ),
                const SizedBox(width: 12),
                Radio<BookingPreference>(
                  value: preference,
                  groupValue: viewModel.selectedPreference,
                  onChanged: (BookingPreference? value) {
                    if (value != null) {
                      viewModel.setPreference(value);
                    }
                  },
                  activeColor: AppColors.darkColor,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
