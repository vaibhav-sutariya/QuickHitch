import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_hitch/configs/assets/image_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/responsive.dart';

class TripPostingRules extends StatelessWidget {
  const TripPostingRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.04),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rules for Posting a Trip',
              style: TextStyle(
                fontSize: getScreenWidth(context) * 0.04, // Scaled text size
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
            ),
            SizedBox(
                height: getScreenHeight(context) * 0.015), // Dynamic spacing
            _buildRuleItem(
                context,
                'Confirm your Trip',
                'Post your trip only if you are confident about driving and can arrive on time.',
                ImageAssets.oneRule,
                AppColors.oneRule),
            _buildRuleItem(
                context,
                'Cash payments are not accepted',
                'All transactions are processed online, with drivers receiving payments post-trip.',
                ImageAssets.twoRule,
                AppColors.twoRule.withOpacity(0.1)),
            _buildRuleItem(
                context,
                'Safe Driving',
                'Stick to speed limits and avoid using your phone while driving.',
                ImageAssets.threeRule,
                AppColors.threeRule.withOpacity(0.1)),
            SizedBox(
                height: getScreenHeight(context) * 0.02), // Dynamic spacing
            Padding(
              padding: EdgeInsets.all(getScreenWidth(context) * 0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.scale(
                    scale: getScreenWidth(context) * 0.0035, // Scaled checkbox
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {
                        // Handle checkbox state change
                      },
                      activeColor: AppColors.darkColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  SizedBox(width: getScreenWidth(context) * 0.02),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: getScreenHeight(context) * 0.005),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: getScreenWidth(context) *
                                  0.035, // Scaled text size
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkColor,
                              fontFamily: GoogleFonts.josefinSans().fontFamily),
                          children: [
                            TextSpan(
                              text: 'I acknowledge and accept the ',
                            ),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRuleItem(BuildContext context, String title, String description,
      String image, Color color) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.015), // Dynamic margin
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03, vertical: screenHeight * 0.015),
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            BorderRadius.circular(screenWidth * 0.04), // Scaled radius
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            height: screenHeight * 0.08, // Responsive image size
            width: screenWidth * 0.16,
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Scaled font size
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Scaled font size
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightColor,
                    height: 1.4,
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
