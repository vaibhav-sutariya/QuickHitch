import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

// ignore: must_be_immutable
class RCustomTile extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool? isLast;
  Color? color;
  RCustomTile({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.isLast,
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
          isLast == true
              ? SizedBox.shrink()
              : Divider(
                  height: 1,
                )
        ],
      ),
    );
  }
}
