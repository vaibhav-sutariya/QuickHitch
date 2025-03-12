import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view_model/controller/home/search_ride_view_model.dart';

class NoRideScreen extends StatelessWidget {
  const NoRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search Result',
        isLeading: true,
        isAction: false,
      ),
      body: Consumer<SearchRideViewModel>(
        builder: (context, value, child) {
          final origin = value.departureLocation.toString().split(',')[0] +
              value.departureLocation.toString().split(',')[1];
          final destination =
              value.destinationLocation.toString().split(',')[0] +
                  value.destinationLocation.toString().split(',')[1];

          return Column(
            children: [
              CustomDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '$origin to $destination',
                            hintStyle: TextStyle(color: AppColors.lightColor),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: AppColors.borderColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: AppColors.focusBorderColor),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Icon(AntDesign.search1,
                                  color: AppColors.lightColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.tune_outlined),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(IconsAssets.noRideFound),
                      const SizedBox(height: 10),
                      Text(
                        'No Ride Found',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.lightColor,
                        ),
                      ),
                      const SizedBox(height: 8), // ✅ Adds spacing
                      SizedBox(
                        width: 230,
                        child: Text(
                          'There are no rides available in your area at the moment. But don\'t worry, you can ride for next date or search nearer to your area.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.lightColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
