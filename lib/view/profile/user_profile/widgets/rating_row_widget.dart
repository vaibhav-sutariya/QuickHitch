import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class RatingRow extends StatelessWidget {
  final String title;
  final IconData icon;
  final double value;
  final Color color;

  const RatingRow({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.darkColor),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.lightColor,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              Text(
                value.toStringAsFixed(1), // Ensures a clean decimal format
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Progress Bar with Foreground and Background
          Stack(
            children: [
              // Background bar (lighter shade)
              Container(
                height: 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2), // Light background
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              // Foreground bar (actual value)
              Container(
                height: 10,
                width: (value / 5.0) * MediaQuery.of(context).size.width * 0.8,
                // Adjusts width dynamically based on screen size
                decoration: BoxDecoration(
                  color: color, // Main progress color
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
