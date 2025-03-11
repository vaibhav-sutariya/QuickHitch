// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.press,
    this.bgColor,
    this.textColor,
  });
  final String text;
  final VoidCallback press;
  final Color? bgColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: Colors.white,
        backgroundColor: bgColor ?? AppColors.primaryColor,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? AppColors.whiteColor,
        ),
      ),
    );
  }
}
