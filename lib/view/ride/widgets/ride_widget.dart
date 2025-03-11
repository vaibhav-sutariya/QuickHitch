import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/rides/ride_model.dart';
import 'package:quick_hitch/view_model/controller/rides/get_all_rides_view_model.dart';

class RideTileWidget extends StatelessWidget {
  final GetAllRidesViewModel viewModel;

  const RideTileWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final bool hasRides =
        viewModel.rides != null && viewModel.rides!.rides!.isNotEmpty;

    if (viewModel.getRidesLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!hasRides) {
      return _buildNoRidesWidget();
    }

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: viewModel.rides!.rides!.length,
        itemBuilder: (context, index) {
          final ride = viewModel.rides!.rides![index];
          return _buildRideItem(context, ride);
        });
  }

  Widget _buildNoRidesWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'No Ride Matches',
                  style: TextStyle(
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        CustomDivider(),
      ],
    );
  }

  Widget _buildRideItem(BuildContext context, Rides ride) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('hh:mm a');
    final departureDate = ride.departureDate != null
        ? DateTime.parse(ride.departureDate!)
        : DateTime.now();
    final formattedDate = dateFormat.format(departureDate);
    final formattedTime = timeFormat.format(departureDate);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesName.rideDeatilsScreen,
          arguments: {'ride': ride},
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$formattedDate | ',
                        style: TextStyle(
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: formattedTime,
                        style: TextStyle(
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.radio_button_checked,
                        color: AppColors.greenColor2),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        ride.origin ?? 'Unknown origin',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.lightColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.radio_button_checked, color: AppColors.redColor),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        ride.destination ?? 'Unknown destination',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.lightColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    ride.bookings != null
                        ? '${ride.bookings!.length} bookings'
                        : 'No Bookings',
                    style: TextStyle(
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          CustomDivider(),
        ],
      ),
    );
  }
}
