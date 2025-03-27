import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/rides/booking_request/get_booking_request_model.dart';

class ReqRideWidget extends StatelessWidget {
  final BookingRequestData ride;
  const ReqRideWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ride.status == 'ACCEPTED' || ride.status == 'REJECTED')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    DateFormat('dd/MM/yyyy | hh:mm a')
                        .format(DateTime.parse(ride.ride!.departureDate!)),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkColor,
                    )),
                Text('\$${ride.noOfSeats.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkColor,
                    )),
              ],
            ),
          if (ride.status == 'ACCEPTED' || ride.status == 'REJECTED')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          Icons.radio_button_checked,
                          size: 18.0,
                          color: AppColors.mediumColor,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${ride.origin} dsbfis iubisd fisbdf',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mediumColor,
                            ),
                          ),
                        ),
                        Text(
                          '(Original)',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.mediumColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 50),
                Text('${ride.noOfSeats.toString()} Seats',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mediumColor,
                    )),
              ],
            ),
          SizedBox(
              height: ride.status == 'ACCEPTED' || ride.status == 'REJECTED'
                  ? 30.0
                  : 0.0),
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
                      ride.origin.toString(),
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
                      ride.destination.toString(),
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
    );
  }
}
