import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class RideViewWidget extends StatelessWidget {
  const RideViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 4.0),
            detailsWidget(),
            SizedBox(height: 8.0),
            LocationWidget(),
            SizedBox(height: 8.0),
          ],
        ));
  }

  Widget detailsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '20/11/2024 | 09:30 AM',
          style: TextStyle(
            color: AppColors.darkColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$60',
              style: TextStyle(
                color: AppColors.darkColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '2 Seats left',
              style: TextStyle(
                color: AppColors.lightColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                      "Toronto International Airport, Silver Dart ...",
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
                      "Toronto, Steeles Avenue, Helton Hill, Onta...",
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
