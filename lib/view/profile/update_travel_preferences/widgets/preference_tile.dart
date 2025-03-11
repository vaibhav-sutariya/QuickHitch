import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/responsive.dart';
import 'package:quick_hitch/view_model/controller/profile/update_travel_preferences/update_travel_preferences_view_model.dart';

class PreferenceTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const PreferenceTile({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UpdateTravelPreferencesViewModel>(context);
    int selectedIndex = provider.getPreference(label);

    return Column(
      children: [
        SizedBox(height: getScreenHeight(context) * 0.015),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getScreenWidth(context) * 0.05,
              vertical: getScreenHeight(context) * 0.015),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: getScreenWidth(context) * 0.15,
                height: getScreenWidth(context) * 0.15,
                padding: EdgeInsets.all(getScreenWidth(context) * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.borderColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon,
                    color: Colors.black54,
                    size: getScreenWidth(context) * 0.08),
              ),
              SizedBox(width: getScreenWidth(context) * 0.05),
              Expanded(
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Prevents unnecessary expansion
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$label:",
                      style: TextStyle(
                        fontSize: 16 * getTextScale(context),
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightColor,
                      ),
                    ),
                    SizedBox(
                        height: getScreenHeight(context) *
                            0.008), // Adaptive spacing
                    LayoutBuilder(builder: (context, constraints) {
                      double buttonWidth = constraints.maxWidth / 3.5;
                      return ToggleButtons(
                        isSelected: [
                          selectedIndex == 0,
                          selectedIndex == 1,
                          selectedIndex == 2
                        ],
                        borderRadius: BorderRadius.circular(20),
                        selectedColor: Colors.white,
                        color: AppColors.darkColor,
                        fillColor: AppColors.darkColor,
                        textStyle: TextStyle(
                            fontSize: 16 * getTextScale(context),
                            fontWeight: FontWeight.bold),
                        onPressed: (index) {
                          provider.updatePreference(label, index);
                        },
                        children: [
                          _buildToggleButton(context, "No", selectedIndex == 0,
                              buttonWidth, 14),
                          _buildToggleButton(context, "Maybe",
                              selectedIndex == 1, buttonWidth, 14),
                          _buildToggleButton(context, "Yes", selectedIndex == 2,
                              buttonWidth, 14),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: getScreenHeight(context) * 0.02),
        CustomDivider(),
      ],
    );
  }

  Widget _buildToggleButton(BuildContext context, String text, bool isSelected,
      double width, double size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: width, // Dynamic width
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? AppColors.whiteColor : AppColors.darkColor,
            fontSize: 14 * getTextScale(context),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
