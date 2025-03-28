import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/responsive.dart';
import 'package:quick_hitch/view_model/controller/home/ride_request/create_request_view_model.dart';

class SeatsRequireWidget extends StatelessWidget {
  final List<int> seats = [1, 2, 3, 4, 5, 6];

  SeatsRequireWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateRequestViewModel>(
      builder: (context, seatViewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Seats Required",
              style: TextStyle(
                fontSize: 12 * getTextScale(context),
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
            ),
            SizedBox(height: getScreenHeight(context) * 0.01),
            LayoutBuilder(
              builder: (context, constraints) {
                double seatSize = constraints.maxWidth / 8;
                return Wrap(
                  alignment: WrapAlignment.start,
                  spacing: getScreenWidth(context) * 0.04,
                  runSpacing: getScreenHeight(context) * 0.02,
                  children: seats.map((seat) {
                    bool isSelected = seatViewModel.selectedSeat == seat;
                    return GestureDetector(
                      onTap: () {
                        seatViewModel.updateSelectedSeat(seat);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: seatSize,
                        height: seatSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppColors.darkColor
                              : AppColors.whiteColor,
                          border: Border.all(
                            color: Colors.blueGrey.shade800,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "$seat",
                          style: TextStyle(
                            fontSize: 16 * getTextScale(context),
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? AppColors.whiteColor
                                : AppColors.darkColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
