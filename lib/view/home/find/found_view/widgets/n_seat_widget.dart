import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/responsive.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';

// ignore: must_be_immutable
class NSeatWidget extends StatelessWidget {
  final Rides ride;
  NSeatWidget({super.key, required this.ride});

  int selectedSeat = 1;
  // Default selected seat
  @override
  Widget build(BuildContext context) {
    List<int> seats = List.generate(ride.emptySeats!,
        (index) => index + 1); // Generate seats up to emptySeats

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "No of Seats",
            style: TextStyle(
              fontSize: 14,
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
                children: List.generate(6, (index) {
                  int seatNumber = index + 1;
                  bool isAvailable = seatNumber <= ride.emptySeats!;
                  bool isSelected = selectedSeat == seatNumber && isAvailable;

                  return GestureDetector(
                    onTap: isAvailable
                        ? () {
                            // setState(() {
                            selectedSeat = seatNumber;
                            // });
                          }
                        : null,
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
                          color: isAvailable
                              ? Colors.blueGrey.shade800
                              : Colors.blueGrey.shade300,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "$seatNumber",
                        style: TextStyle(
                          fontSize: 16 * getTextScale(context),
                          fontWeight: FontWeight.bold,
                          color: isAvailable
                              ? (isSelected
                                  ? AppColors.whiteColor
                                  : AppColors.darkColor)
                              : Colors.blueGrey
                                  .shade300, // Light grey for unavailable
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
