import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Forgot Password?', style: TextStyle(color: AppColors.lightColor)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.forgotPasswordScreen, (route) => false);
          },
          child: Text(
            'Reset',
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
