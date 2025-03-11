import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view/profile/user_profile/widgets/rating_row_widget.dart';
import 'package:quick_hitch/view_model/controller/profile/get_profile/get_user_profile_view_model.dart';

class ReviewWidget extends StatelessWidget {
  final GetUserProfileViewModel provider;
  const ReviewWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Review and ratings",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                provider.userProfile!.data.user.rating.toStringAsFixed(1),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkColor),
              ),
              const SizedBox(width: 8),
              RatingBarIndicator(
                rating: provider.userProfile!.data.user.rating.toDouble(),
                itemBuilder: (context, index) =>
                    const Icon(Icons.star, color: AppColors.yellowColor2),
                itemCount: 5,
                itemSize: 30,
                direction: Axis.horizontal,
              ),
            ],
          ),
          const SizedBox(height: 16),
          RatingRow(
              title: "Timeliness",
              icon: Icons.access_time,
              value: 0 ??
                  provider.userProfile!.data.ratings.avgRatings!.timeliness!
                      .toDouble(),
              color: AppColors.primaryColor),
          RatingRow(
              title: "Communication",
              icon: Icons.chat,
              value: 0 ??
                  provider.userProfile!.data.ratings.avgRatings!.communication!
                      .toDouble(),
              color: AppColors.yellowColor),
          RatingRow(
              title: "Safety",
              icon: Icons.security,
              value: 0 ??
                  provider.userProfile!.data.ratings.avgRatings!.safety!
                      .toDouble(),
              color: AppColors.greenColor),
        ],
      ),
    );
  }
}
