import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/responsive.dart';
import 'package:quick_hitch/view_model/controller/home/search_ride_view_model.dart';

class PrefTile extends StatelessWidget {
  final String label;

  const PrefTile({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchRideViewModel>(context);
    String selectedValue = provider.preferences[label] ?? 'Maybe';
    int selectedIndex = provider.getPreferenceIndex(label);

    return Column(
      children: [
        SizedBox(height: getScreenHeight(context) * 0.015),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getScreenWidth(context) * 0.0005,
              vertical: getScreenHeight(context) * 0.000015),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "$label:",
                  style: TextStyle(
                    fontSize: 16 * getTextScale(context),
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightColor,
                  ),
                ),
              ),
              LayoutBuilder(builder: (context, constraints) {
                double buttonWidth = constraints.maxWidth / 3.5;
                return SizedBox(
                  height: 40,
                  child: ToggleButtons(
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
                      String value = provider.getPreferenceValue(index);
                      provider.setPreference(label, value);
                    },
                    children: [
                      _buildToggleButton(
                          context, "No", selectedIndex == 0, buttonWidth),
                      _buildToggleButton(
                          context, "Maybe", selectedIndex == 1, buttonWidth),
                      _buildToggleButton(
                          context, "Yes", selectedIndex == 2, buttonWidth),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButton(
      BuildContext context, String text, bool isSelected, double width) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: 0.1 * getScreenWidth(context),
        height: 40,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? AppColors.whiteColor : AppColors.darkColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
