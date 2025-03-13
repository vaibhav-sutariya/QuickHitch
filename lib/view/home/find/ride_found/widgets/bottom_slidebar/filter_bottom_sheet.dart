import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/view/home/find/ride_found/widgets/bottom_slidebar/widgets/pref_tile.dart';
import 'package:quick_hitch/view_model/controller/home/search_ride_view_model.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchRideViewModel>(
      builder: (context, filterViewModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 135,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.borderColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filter Rides",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => filterViewModel.clearAll(),
                      child: Text(
                        "Clear all",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.lightColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 16),
              CustomDivider(),
              // Price Range Slider
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price Per Seat",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${filterViewModel.minPrice.toInt()}",
                            style: TextStyle(fontSize: 14)),
                        Text("\$${filterViewModel.maxPrice.toInt()}",
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),

              RangeSlider(
                labels: RangeLabels(filterViewModel.minPrice.toInt().toString(),
                    filterViewModel.maxPrice.toInt().toString()),
                values: RangeValues(
                    filterViewModel.minPrice, filterViewModel.maxPrice),
                min: 50,
                max: 200,
                activeColor: AppColors.blackColor,
                inactiveColor: AppColors.borderColor,
                onChanged: (RangeValues values) {
                  filterViewModel.setPriceRange(values.start, values.end);
                },
              ),
              SizedBox(height: 16),
              CustomDivider(),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Travel Preferences",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Column(children: [
                      PrefTile(label: "Conversation"),
                      PrefTile(label: "Music"),
                      PrefTile(label: "Pet"),
                      PrefTile(label: "Smoking"),
                    ]),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomElevatedButton(text: 'Apply now', press: () {}),
              ),
            ],
          ),
        );
      },
    );
  }
}
