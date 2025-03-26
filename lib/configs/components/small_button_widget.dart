import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class SmallButtonWidget extends StatelessWidget {
  final Color color;
  final Function() onPressed;
  final bool isLoading;
  final String text;
  final IconData icon;
  const SmallButtonWidget({
    super.key,
    required this.color,
    required this.onPressed,
    required this.isLoading,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              iconColor: AppColors.whiteColor,
              backgroundColor: color,
              // minimumSize: Size(152, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: onPressed,
            label: Text(
              text,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            icon: Icon(icon),
            iconAlignment: IconAlignment.end,
          );
  }
}
