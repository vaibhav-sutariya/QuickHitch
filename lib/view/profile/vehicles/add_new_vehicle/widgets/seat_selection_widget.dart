import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/responsive.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/find_one_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/vehicle_mgmn_view_model.dart';

class SeatSelectionWidget extends StatelessWidget {
  final List<int> seats = [1, 2, 3, 4, 5, 6];
  final FindOneVehicleViewModel oneProvider;
  final bool? isUpdate;
  final ValueNotifier<int> selectedSeat;

  SeatSelectionWidget({
    super.key,
    required this.oneProvider,
    this.isUpdate,
  }) : selectedSeat = ValueNotifier<int>(
          isUpdate == true ? oneProvider.vehicle?.noOfSeats ?? 1 : 1,
        );

  @override
  Widget build(BuildContext context) {
    final seatViewModel =
        Provider.of<VehicleMgmtViewModel>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "No of Seats",
          style: TextStyle(
            fontSize: 12 * getTextScale(context),
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
        ),
        SizedBox(height: getScreenHeight(context) * 0.01),
        ValueListenableBuilder<int>(
          valueListenable: selectedSeat,
          builder: (context, value, child) {
            return LayoutBuilder(
              builder: (context, constraints) {
                double seatSize = constraints.maxWidth / 8;
                return Wrap(
                  alignment: WrapAlignment.start,
                  spacing: getScreenWidth(context) * 0.04,
                  runSpacing: getScreenHeight(context) * 0.02,
                  children: seats.map((seat) {
                    bool isSelected = value == seat;
                    return GestureDetector(
                      onTap: () {
                        selectedSeat.value = seat;
                        seatViewModel.updateSelectedSeat(seat);
                      },
                      child: Container(
                        width: seatSize,
                        height: seatSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? Colors.blueGrey.shade800
                              : Colors.white,
                          border: Border.all(
                              color: Colors.blueGrey.shade800, width: 1),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "$seat",
                          style: TextStyle(
                            fontSize: 16 * getTextScale(context),
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : Colors.blueGrey.shade800,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
