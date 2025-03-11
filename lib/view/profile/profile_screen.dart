import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/view/profile/widget/image_name_widget.dart';
import 'package:quick_hitch/view/profile/widget/menu_item_widget.dart';
import 'package:quick_hitch/view_model/services/session_manager.dart/session_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        isLeading: false,
        isAction: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomDivider(),
            ImageNameWidget(),
            CustomDivider(),
            // SizedBox(height: 10),
            MenuItemWidget(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.userProfileScreen);
                },
                icon: IconsAssets.profile,
                title: 'View Your Profile',
                isLogout: false),
            MenuItemWidget(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.updateProfileScreen);
                },
                icon: IconsAssets.profileSetting,
                title: 'Profile Setting',
                isLogout: false),
            MenuItemWidget(
                onPressed: () {},
                icon: IconsAssets.notification,
                title: 'Notifications',
                isLogout: false),
            MenuItemWidget(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.vehicleDetailScreen);
                },
                icon: IconsAssets.vehicles,
                title: 'My Vehicles',
                isLogout: false),
            MenuItemWidget(
                onPressed: () {
                  Navigator.pushNamed(
                      context, RoutesName.updateTravelPreferenceScreen);
                },
                icon: IconsAssets.travel,
                title: 'Travel Preferences',
                isLogout: false),
            MenuItemWidget(
                onPressed: () {},
                icon: IconsAssets.passenger,
                title: 'Passenger Payment',
                isLogout: false),
            MenuItemWidget(
                onPressed: () {},
                icon: IconsAssets.driverPayout,
                title: 'Driver Payout',
                isLogout: false),
            MenuItemWidget(
                onPressed: () => Navigator.pushNamed(
                    context, RoutesName.changePasswordScreen),
                icon: IconsAssets.changePassword,
                title: 'Change Password',
                isLogout: false),
            MenuItemWidget(
                onPressed: () {
                  SessionController().clearSession();
                  if (SessionController().isLogin == false) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutesName.login, (route) => false);
                  }
                },
                icon: IconsAssets.logout,
                title: 'Log Out',
                isLogout: true),
          ],
        ),
      ),
    );
  }
}
