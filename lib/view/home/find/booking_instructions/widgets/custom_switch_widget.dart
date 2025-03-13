import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/booking_view_model.dart';

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewModel>(
      builder: (context, switchViewModel, child) {
        return GestureDetector(
          onTap: () {
            switchViewModel.toggleSwitch(!switchViewModel.isSwitched);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 60,
            height: 35,
            padding: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: switchViewModel.isSwitched
                  ? AppColors.darkColor
                  : AppColors.darkColor,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.close,
                    color: AppColors.whiteColor,
                    size: 16,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.check,
                    color: AppColors.whiteColor,
                    size: 16,
                  ),
                ),
                AnimatedAlign(
                  duration: Duration(milliseconds: 300),
                  alignment: switchViewModel.isSwitched
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor,
                    ),
                    child: Icon(
                      switchViewModel.isSwitched ? Icons.check : Icons.close,
                      size: 14,
                      color: AppColors.darkColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
