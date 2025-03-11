import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';

class StopsView extends StatelessWidget {
  final List<String> stops;

  const StopsView({
    super.key,
    required this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PostRideViewModel>(builder: (context, viewModel, child) {
      List<String> fullStops = [...stops];

      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: fullStops.length - 1,
            itemBuilder: (context, index) {
              return _buildStopItem(
                context,
                fullStops[index],
                fullStops[index + 1],
                index,
                viewModel,
              );
            },
          ),
        ],
      );
    });
  }

  Widget _buildStopItem(
    BuildContext context,
    String from,
    String to,
    int index,
    PostRideViewModel viewModel,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '\$${viewModel.pricePerSeat}',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
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
                      Icon(Icons.more_vert, color: Colors.grey, size: 16.0),
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
                          from,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        Divider(color: AppColors.borderColor, thickness: 1.0),
                        SizedBox(height: 4.0),
                        Text(
                          to,
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
              if (index != stops.length - 2) SizedBox(height: 20.0),
            ],
          ),
        ),
        if (index != stops.length - 2) CustomDivider(),
      ],
    );
  }
}
