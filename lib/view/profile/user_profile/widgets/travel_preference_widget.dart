import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/profile/get_profile/get_user_profile_view_model.dart';

class TravelPreferencesWidget extends StatelessWidget {
  final GetUserProfileViewModel provider;
  final bool? isRide;
  const TravelPreferencesWidget(
      {super.key, required this.provider, this.isRide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isRide == true)
            const Text(
              "Travel Preferences",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
            ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Left Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TravelPreferenceItem(
                      icon: Icons.chat_bubble_outline,
                      text: "Conversation Ok",
                    ),
                    TravelPreferenceItem(
                      icon: Icons.pets,
                      text: "${provider.userProfile!.data.user.pets} Pets",
                    ),
                    TravelPreferenceItem(
                      icon: Icons.business_center_outlined,
                      text:
                          "${provider.userProfile!.data.user.smoking} Luggage",
                    ),
                  ],
                ),
              ),

              // Right Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TravelPreferenceItem(
                      icon: Icons.volume_up_outlined,
                      text: "Music ${provider.userProfile!.data.user.music} ",
                    ),
                    TravelPreferenceItem(
                      icon: Icons.smoking_rooms_outlined,
                      text:
                          "${provider.userProfile!.data.user.smoking}  Smoking",
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

class TravelPreferenceItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const TravelPreferenceItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.lightColor),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.lightColor,
            ),
          ),
        ],
      ),
    );
  }
}
