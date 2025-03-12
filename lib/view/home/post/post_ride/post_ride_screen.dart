import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/components/custom_text_field.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/view/home/post/post_ride/widgets/booking_preferences_widget.dart';
import 'package:quick_hitch/view/home/post/post_ride/widgets/date_time_picker_widget.dart';
import 'package:quick_hitch/view/home/post/post_ride/widgets/seats_widget.dart';
import 'package:quick_hitch/view/home/post/post_ride/widgets/vehicle_dropdown.dart';
import 'package:quick_hitch/view/home/widgets/place_enter_field.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/travel_preference_widget.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/get_profile/get_user_profile_view_model.dart';

class PostRideScreen extends StatelessWidget {
  const PostRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Post Ride',
        isLeading: true,
        isAction: false,
      ),
      body: SingleChildScrollView(
        child:
            Consumer<PostRideViewModel>(builder: (context, viewModel, child) {
          return Column(
            children: [
              CustomDivider(),
              SizedBox(height: 20),
              // GoogleField(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    PlaceEnterField(
                      iconColor: AppColors.greenColor2,
                      hintText: 'Enter your location',
                      onLocationSelected: (location, lat, lng) {
                        viewModel.setDepartureLocation(location, lat, lng);
                        viewModel.setStopLocation(location, lat, lng);
                      },
                    ),
                    const SizedBox(height: 10),
                    ...viewModel.stops,
                    PlaceEnterField(
                      iconColor: AppColors.redColor,
                      hintText: 'Enter destination location',
                      onLocationSelected: (location, lat, lng) {
                        viewModel.setDestinationLocation(location, lat, lng);
                        viewModel.setStopLocation(location, lat, lng);
                      },
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: viewModel.addStop,
                      label: Text(
                        'Add stops',
                        style: TextStyle(
                          color: AppColors.darkColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      icon: Icon(
                        Icons.add,
                        color: AppColors.darkColor,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              // SizedBox(height: 10),
              DateTimePickerWidget(
                selectedDate: viewModel.selectedDate,
                selectedTime: viewModel.selectedTime,
                onDateTap: () => viewModel.pickDate(context),
                onTimeTap: () => viewModel.pickTime(context),
                isReturn: false,
              ),
              // SizedBox(height: 10),
              viewModel.isReturn
                  ? DateTimePickerWidget(
                      selectedDate: viewModel.returnDate,
                      selectedTime: viewModel.returnTime,
                      onDateTap: () =>
                          viewModel.pickDate(context, isReturnTrip: true),
                      onTimeTap: () =>
                          viewModel.pickTime(context, isReturnTrip: true),
                      isReturn: true,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: viewModel.toggleReturnTrip,
                          child: Text(
                            'Add return trip',
                            style: TextStyle(
                              color: AppColors.darkColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      isPrefix: true,
                      title: 'Price Per Seat',
                      hintText: '',
                      onChanged: (value) {
                        viewModel.setPricePerSeat(value);
                      },
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                        title: 'Description',
                        hintText: '',
                        maxLines: 3,
                        onChanged: (value) {
                          viewModel.setDescription(value);
                        },
                      ),
                    ),
                    SeatWidget(
                        // oneProvider: viewModel,
                        ),
                    SizedBox(height: 20),
                    VehicleDropdownView(),
                    Consumer<GetUserProfileViewModel>(
                        builder: (context, provider, child) {
                      return TravelPreferencesWidget(
                        provider: provider,
                      );
                    }),
                    BookingPreferenceWidget(),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomElevatedButton(
                          text: 'Next',
                          press: () {
                            viewModel.postRide(context);
                            Navigator.pushNamed(
                              context,
                              RoutesName.addStopsScreen,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
