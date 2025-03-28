import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/components/custom_text_field.dart';
import 'package:quick_hitch/view/home/ride_request/widgets/departure_date_picker_widget.dart';
import 'package:quick_hitch/view/home/ride_request/widgets/seats_require_widgets.dart';
import 'package:quick_hitch/view/home/widgets/place_enter_field.dart';
import 'package:quick_hitch/view_model/controller/home/ride_request/create_request_view_model.dart';

class CreateRideRequestScreen extends StatelessWidget {
  const CreateRideRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Post a Request',
        isLeading: true,
        isAction: false,
      ),
      body: Column(
        children: [
          // Expanded to push the button to the bottom
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<CreateRequestViewModel>(
                builder: (context, viewModel, child) {
                  return Column(
                    children: [
                      CustomDivider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Column(
                          children: [
                            PlaceEnterField(
                              iconColor: AppColors.greenColor2,
                              hintText: 'Enter your location',
                              onLocationSelected: (location, lat, lng) {
                                viewModel.setDepartureLocation(
                                    location, lat, lng);
                              },
                            ),
                            const SizedBox(height: 10),
                            PlaceEnterField(
                              iconColor: AppColors.redColor,
                              hintText: 'Enter destination location',
                              onLocationSelected: (location, lat, lng) {
                                viewModel.setDestinationLocation(
                                    location, lat, lng);
                              },
                            ),
                          ],
                        ),
                      ),
                      CustomDivider(),
                      const SizedBox(height: 10),
                      DepartureDatePicker(viewModel: viewModel),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SeatsRequireWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomTextField(
                          onChanged: (value) {
                            viewModel.setDescription(value);
                          },
                          maxLines: 3,
                          title: 'Description',
                          hintText:
                              'Tell drivers a little bit more about you and why you are travelling.',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          // Custom Elevated Button at Bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomElevatedButton(
              text: 'Post Request',
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}
