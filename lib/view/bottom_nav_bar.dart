import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view/home/home_screen.dart';
import 'package:quick_hitch/view/inbox/inbox_screen.dart';
import 'package:quick_hitch/view/profile/profile_screen.dart';
import 'package:quick_hitch/view/ride/ride_screen.dart';
import 'package:quick_hitch/view_model/services/bottom_nav_bar/bottom_navbar_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: IndexedStack(
            index: provider.currentIndex,
            children: const [
              HomeScreen(),
              MyRideScreen(),
              InboxScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            height: 98.0, // Increased height for better spacing
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: BottomNavigationBar(
              selectedFontSize: 12,
              unselectedFontSize: 12,
              currentIndex: provider.currentIndex,
              onTap: (index) => provider.updateIndex(index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.lightColor,
              showUnselectedLabels: true,
              elevation: 0, // Remove default shadow
              items: [
                _buildNavItem(provider, 0, IconsAssets.home, 'Home'),
                _buildNavItem(provider, 1, IconsAssets.car, 'Rides'),
                _buildNavItem(provider, 2, IconsAssets.inbox, 'Inbox'),
                _buildNavItem(provider, 3, IconsAssets.profile, 'Profile'),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Helper function to create BottomNavigationBarItem with proper spacing and background highlight for the active icon
  BottomNavigationBarItem _buildNavItem(
      BottomNavBarProvider provider, int index, String icon, String label) {
    bool isSelected = provider.currentIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:
                const EdgeInsets.all(8), // Padding inside the background circle
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? Colors.grey.shade200
                  : Colors.transparent, // Background color for selected icon
            ),
            child: SvgPicture.asset(
              icon,
              height: 24,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.lightColor, // Icon color
            ),
          ),
          const SizedBox(height: 5), // Space between icon and label
        ],
      ),
      label: label,
    );
  }
}
