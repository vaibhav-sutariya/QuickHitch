import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/find_one_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/vehicle_mgmn_view_model.dart';

class LuggageSelectionWidget extends StatelessWidget {
  final List<String> options = const ["No luggage", "S", "M", "L"];
  final FindOneVehicleViewModel oneProvider;
  final bool? isUpdate;
  final ValueNotifier<String> selectedOption;

  LuggageSelectionWidget({
    super.key,
    required this.oneProvider,
    this.isUpdate,
  }) : selectedOption = ValueNotifier<String>(
          isUpdate == true && oneProvider.vehicle != null
              ? oneProvider.vehicle!.luggage ?? "No luggage"
              : "No luggage",
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Luggage",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.darkColor, width: 1.5),
          ),
          child: Consumer<VehicleMgmtViewModel>(
            builder: (context, value, child) {
              return Row(
                children: options.map((option) {
                  return _buildOption(option, value.luggageSelectedOption);
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOption(String text, String selectedValue) {
    bool isSelected = selectedValue == text;

    return Expanded(
      child: Consumer<VehicleMgmtViewModel>(
        builder: (context, value, child) {
          return GestureDetector(
            onTap: () {
              value.updateLuggageSelection(text); // Update ViewModel
              log('Selected Luggage: ${value.luggageSelectedOption}');
              log('Selected Luggage: $text');
            },
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.darkColor : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.luggage,
                      size: 16,
                      color: isSelected
                          ? AppColors.whiteColor
                          : AppColors.darkColor,
                    ),
                    if (text != "No luggage") const SizedBox(width: 6),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? AppColors.whiteColor
                            : AppColors.darkColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
