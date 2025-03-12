import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view_model/controller/home/search_ride_view_model.dart';

class RideTileWidget extends StatelessWidget {
  final SearchRideViewModel viewModel;
  const RideTileWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchRideViewModel>(
      builder: (context, value, child) {
        final data = value.rides!.rides;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: value.rides?.rides?.length ?? 0,
          itemBuilder: (context, index) {
            final ride = value.rides!.rides![index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            data![index].ride!.driver!.picture ?? ''),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${ride.ride!.driver!.firstName} ${ride.ride!.driver!.lastName}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkColor,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${data[index].ride!.driver!.cCount!.driverRide ?? 0} Rides Completed',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightColor,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(Icons.circle,
                                  color: AppColors.lightColor, size: 5),
                              const SizedBox(width: 10),
                              Text('${data[index].ride!.driver!.rating ?? 0.0}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightColor,
                                  )),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '\$${ride.pricePerSeat}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('dd/MM/yyyy | hh:mm a')
                            .format(DateTime.parse(ride.ride!.departureDate!)),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkColor,
                        ),
                      ),
                      Text('${ride.emptySeats} Seats left',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightColor,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.radio_button_checked,
                                color: AppColors.greenColor2,
                                size: 18.0,
                              ),
                              SizedBox(height: 4.0),
                              Icon(
                                Icons.more_vert,
                                color: Colors.grey,
                                size: 16.0,
                              ),
                              SizedBox(height: 4.0),
                              Icon(
                                Icons.radio_button_checked,
                                color: AppColors.redColor,
                                size: 18.0,
                              ),
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viewModel.departureLocation.toString(),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Divider(
                                  color: AppColors.borderColor,
                                  thickness: 1.0,
                                  height: 16.0,
                                ),
                                Text(
                                  viewModel.destinationLocation.toString(),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomDivider(),
                const SizedBox(height: 10),
              ],
            );
          },
        );
      },
    );
  }
}
