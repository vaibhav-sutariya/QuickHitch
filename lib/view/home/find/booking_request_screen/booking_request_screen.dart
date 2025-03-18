import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';

class BookingRequestScreen extends StatelessWidget {
  const BookingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booking Request',
        isLeading: true,
        isAction: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              CustomDivider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        _buildInfoText(
                          'Anaya has received your booking request and will review it shortly.',
                        ),
                        _buildInfoCard(
                            AppColors.yellowColor,
                            'Wait for approval',
                            'Anaya has until departure to review your booking request. We’ll send you a notification as soon it’s been reviewed.'),
                        SizedBox(height: 10),
                        _buildInfoCard(
                            AppColors.primaryColor,
                            'Message to Anaya',
                            'Feel free to message to Anaya if you have any questions about your booking.'),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: CustomElevatedButton(
                  text: 'Confirm Request to Book',
                  press: () {},
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.darkColor,
        ),
      ),
    );
  }

  Widget _buildInfoCard(Color color, String title, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(IconsAssets.chat, width: 64), // Responsive SVG
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightColor,
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
