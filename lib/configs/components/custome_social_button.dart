import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class CustomeSocialButton extends StatelessWidget {
  const CustomeSocialButton(
      {super.key,
      required this.text,
      required this.iconPath,
      required this.press});

  final String text;
  final String iconPath;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        overlayColor: Colors.blueGrey,
        backgroundColor: Colors.white,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: AppColors.borderColor),
        ),
      ),
      onPressed: press,
      icon: SvgPicture.asset(
        iconPath,
        height: 19,
        width: 19,
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
