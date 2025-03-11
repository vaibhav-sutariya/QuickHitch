import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_hitch/configs/assets/image_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class TripPostingRules extends StatelessWidget {
  const TripPostingRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rules for Posting a Trip',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
            ),
            _buildRuleItem(
                'Confirm your Trip',
                'Post your trip only if you are confident \nabout driving and can arrive on time',
                ImageAssets.oneRule,
                AppColors.oneRule),
            _buildRuleItem(
                'Cash payments are not accepted',
                'All transactions are processed online, \nwith drivers receiving payments post-trip.',
                ImageAssets.twoRule,
                AppColors.twoRule.withOpacity(0.1)),
            _buildRuleItem(
                'Safe Driving',
                'Stick to speed limits and avoid using \nyour phone while driving.',
                ImageAssets.threeRule,
                AppColors.threeRule.withOpacity(0.1)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {
                        // setState(() {
                        //   _isAcknowledged = value ?? false;
                        // });
                        // widget.onAcknowledged(_isAcknowledged);
                      },
                      activeColor: AppColors.darkColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkColor,
                          ),
                          children: [
                            TextSpan(
                              text: 'I acknowledge and accept the ',
                              style: TextStyle(
                                  color: AppColors.darkColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                                color: AppColors.darkColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '. And I understand that violating these rules may lead to account suspension.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRuleItem(
      String title, String description, String image, Color color) {
    return Container(
      height: 90, // Adjusted height
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: color, // Soft background color
        borderRadius: BorderRadius.circular(16.0), // More rounded corners
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            height: 64.0, // Smaller icon size
            width: 64.0,
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0, // Slightly larger font
                    fontWeight: FontWeight.w500, // Bolder title
                    color: AppColors.darkColor,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightColor,
                    height: 1.4, // Line height for readability
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
