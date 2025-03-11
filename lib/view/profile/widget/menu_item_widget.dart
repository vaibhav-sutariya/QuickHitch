import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isLogout,
    required this.onPressed,
  });

  final String icon;
  final String title;
  final bool isLogout;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(8),
            splashColor: AppColors.primaryColor.withOpacity(0.1),
            highlightColor: AppColors.primaryColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: SvgPicture.asset(icon),
                title: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                trailing: isLogout
                    ? null
                    : const Icon(Icons.arrow_forward_ios,
                        size: 16, color: AppColors.darkColor),
              ),
            ),
          ),
        ),
        if (!isLogout)
          const Divider(
            thickness: 0.5,
            height: 0,
          ),
      ],
    );
  }
}
