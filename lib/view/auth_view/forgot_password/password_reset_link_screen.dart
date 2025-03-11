import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/view/auth_view/custom_text.dart';

class PasswordResetLinkScreen extends StatelessWidget {
  const PasswordResetLinkScreen({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: SvgPicture.asset(IconsAssets.emailCamp)),
            SizedBox(
              height: 20,
            ),
            Text(
              'Password reset link sent',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CustomText(
              align: MainAxisAlignment.start,
              press: () {},
              text: 'Sign in',
              title: 'Back to ',
              size: 16,
              weight: FontWeight.w600,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'We have sent an reset password mail to $email address',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.lightColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(text: 'View mail', press: () {}),
          ],
        ),
      ),
    );
  }
}
