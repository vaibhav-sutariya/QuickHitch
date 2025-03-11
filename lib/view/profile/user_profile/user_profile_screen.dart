import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/components/shimmer_widget.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/details_widget.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/name_bio_widget.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/review_widget.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/ride_toggle_widget.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/ride_view_widget.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/travel_preference_widget.dart';
import 'package:quick_hitch/view_model/controller/profile/get_profile/get_user_profile_view_model.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch user profile once the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetUserProfileViewModel>(context, listen: false)
          .getUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetUserProfileViewModel()..getUserProfile(),
      child: Consumer<GetUserProfileViewModel>(
        builder: (context, provider, child) {
          var user = provider.userProfile;

          return Scaffold(
            appBar: CustomAppBar(
              title: user != null
                  ? '${user.data.user.firstName}\'s Profile'
                  : 'Profile',
              isLeading: true,
              isAction: false,
            ),
            body: user == null
                ? const ShimmerLoaderWidget() // Show shimmer loader when data is loading
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const CustomDivider(),
                        NameBioWidget(provider: provider),
                        const CustomDivider(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DetailsWidget(
                                icon: Icons.drive_eta_outlined,
                                value: user.data.stats.peopleDriven,
                                title: 'People Driven',
                              ),
                              DetailsWidget(
                                icon: Icons.car_rental,
                                value: user.data.stats.ridesTaken,
                                title: 'Rides Taken',
                              ),
                              DetailsWidget(
                                icon: Icons.trending_up,
                                value: user.data.stats.kmsDriven,
                                title: 'Kms Driven',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomElevatedButton(
                            bgColor: AppColors.whiteColor,
                            textColor: AppColors.primaryColor,
                            text: 'Chat With Driver',
                            press: () {},
                          ),
                        ),
                        const CustomDivider(),
                        ReviewWidget(provider: provider),
                        const CustomDivider(),
                        const RideToggle(),
                        const RideViewWidget(),
                        const CustomDivider(),
                        const SizedBox(height: 4.0),
                        const RideViewWidget(),
                        const SizedBox(height: 20),
                        Text(
                          'View all ride',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const CustomDivider(),
                        TravelPreferencesWidget(
                            isRide: true, provider: provider),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
