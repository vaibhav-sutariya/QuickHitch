import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    this.title,
    required this.text,
    required this.press,
    this.align,
    this.size,
    this.weight,
  });
  String? title = '';
  final String text;
  final VoidCallback press;
  MainAxisAlignment? align;
  double? size;
  FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisAlignment: align ?? MainAxisAlignment.center,
      children: [
        Text(title ?? 'Don\'t have an account?',
            style: TextStyle(
              color: AppColors.lightColor,
              fontWeight: weight ?? FontWeight.w400,
              fontSize: size ?? 14,
            )),
        GestureDetector(
          onTap: press,
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: weight ?? FontWeight.w400,
              fontSize: size ?? 14,
            ),
          ),
        ),
      ],
    );
  }
}
