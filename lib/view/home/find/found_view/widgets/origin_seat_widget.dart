import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';

class OriginSeatWidget extends StatelessWidget {
  final Rides ride;
  const OriginSeatWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
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
          Text('${ride.emptySeats.toString()} Seats Left',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.mediumColor,
              )),
        ],
      ),
    );
  }
}
