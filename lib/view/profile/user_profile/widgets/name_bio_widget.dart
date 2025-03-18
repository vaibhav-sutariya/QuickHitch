import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/configs/assets/image_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/profile/get_profile/get_user_profile_view_model.dart';

class NameBioWidget extends StatelessWidget {
  final GetUserProfileViewModel provider;
  const NameBioWidget({super.key, required this.provider});

  /// Function to calculate age from date of birth (dob)
  int _calculateAge(String dob) {
    try {
      DateTime birthDate =
          DateFormat("yyyy-MM-dd").parse(dob); // Adjust format as needed
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;

      // Check if the birthday has passed this year, if not subtract 1
      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (e) {
      return 0; // Return 0 if parsing fails
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = provider.userProfile!.data.user;
    final int userAge = _calculateAge(user.dob);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: user.picture == null
                    ? AssetImage(ImageAssets.userImage)
                    : Image.network(user.picture).image,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkColor,
                    ),
                  ),
                  Text(
                    '${user.gender}, $userAge years old',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Bio',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkColor,
            ),
          ),
          Text(
            user.bio,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.lightColor,
            ),
          ),
        ],
      ),
    );
  }
}
