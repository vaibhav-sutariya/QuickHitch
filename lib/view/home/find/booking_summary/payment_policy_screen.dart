import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';

class PaymentPolicyScreen extends StatelessWidget {
  const PaymentPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booking Summary',
        isLeading: true,
        isAction: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth > 600 ? 32.0 : 16.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDivider(),
                  SizedBox(height: 16),
                  _buildSectionTitle('Our payment policies'),
                  _buildSectionText(
                    'A Passenger can withdraw their Booking request before Driver approval without any charges.',
                  ),
                  _buildSectionText(
                    'If the Booking request expires, the Passenger is not charged, and a full refund is issued.',
                  ),
                  SizedBox(height: 20),
                  _buildSectionTitle('Refund'),
                  _buildSectionSubTitle('More than 24 hours before departure'),
                  _buildSectionText(
                    'Passenger receives a full refund of the Trip Contribution, but the Booking fee is retained by QuickHitch as a cancellation fee.',
                  ),
                  SizedBox(height: 8),
                  _buildSectionSubTitle('Less than 24 hours before departure'),
                  _buildSectionText(
                    'Driver receives 50% of the Contribution. Passengers are refunded the remaining 50% of the Contribution.',
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Custom Title Text Style
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.darkColor,
      ),
    );
  }

  /// Custom Subtitle Text Style
  Widget _buildSectionSubTitle(String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        subtitle,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.darkColor,
        ),
      ),
    );
  }

  /// Custom Content Text Style
  Widget _buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.lightColor,
        ),
      ),
    );
  }
}
