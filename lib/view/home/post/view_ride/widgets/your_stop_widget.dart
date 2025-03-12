import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view/home/post/view_ride/widgets/stop_view_widget.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';

class YourStopWidget extends StatefulWidget {
  const YourStopWidget({super.key});

  @override
  State<YourStopWidget> createState() => _YourStopWidgetState();
}

class _YourStopWidgetState extends State<YourStopWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostRideViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Stops',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkColor,
                      ),
                    ),
                    Icon(
                      _isExpanded ? Icons.expand_less : Icons.arrow_forward_ios,
                      color: AppColors.darkColor,
                      size: 18.0,
                    ),
                  ],
                ),
              ),
            ),
            if (_isExpanded)
              Container(
                child: viewModel.stops.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No stops added yet',
                          style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : StopsView(
                        stops: viewModel.stopLocations
                            .map((e) => e['name'].toString())
                            .toList(),
                      ),
              ),
          ],
        );
      },
    );
  }
}
