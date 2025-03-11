import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view/home/add_stops/widgets/stops_widget.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';

class AddStopsScreen extends StatelessWidget {
  const AddStopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(title: 'Add Stops', isLeading: true, isAction: false),
      body: Consumer<PostRideViewModel>(builder: (context, viewModel, child) {
        return Column(
          children: [
            CustomDivider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 8,
                  children: [
                    SizedBox(height: 8.0),
                    StopsWidget(
                      // departure: viewModel.departureLocation.toString(),
                      // destination: viewModel.destinationLocation.toString(),
                      stops: viewModel.stopLocations
                          .map((e) => e['name'].toString())
                          .toList(),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: CustomElevatedButton(text: 'Next', press: () {}),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
