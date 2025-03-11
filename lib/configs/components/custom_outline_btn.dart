import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          side: BorderSide(
            color: AppColors.primaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
        ),
        onPressed: onPressed,
        label: Text(
          text,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        icon: Icon(
          icon,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
