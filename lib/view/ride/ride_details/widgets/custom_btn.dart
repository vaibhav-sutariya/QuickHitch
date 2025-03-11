import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

// ignore: must_be_immutable
class CustomBtn extends StatelessWidget {
  final String text;
  final Function() onPressed;
  Color? color;
  CustomBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          // CustomDivider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                    style: TextStyle(
                      color: color ?? AppColors.darkColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    )),
                Icon(Icons.arrow_forward_ios,
                    color: AppColors.darkColor, size: 18.0),
              ],
            ),
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
