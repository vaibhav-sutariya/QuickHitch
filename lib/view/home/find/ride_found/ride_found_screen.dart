import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view/home/find/ride_found/widgets/bottom_slidebar/filter_bottom_sheet.dart';
import 'package:quick_hitch/view/home/find/ride_found/widgets/ride_tile_widget.dart';
import 'package:quick_hitch/view/home/find/ride_found/widgets/search_toggle.dart';
import 'package:quick_hitch/view/home/widgets/custom_floating_action_button.dart';
import 'package:quick_hitch/view_model/controller/home/search_ride_view_model.dart';

class RideFoundScreen extends StatelessWidget {
  const RideFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Search Result',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.tune_outlined),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (context) => FilterBottomSheet(),
                );
              },
            ),
          )
        ],
      ),
      body: Consumer<SearchRideViewModel>(
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDivider(),
                const SizedBox(height: 10),
                SearchToggle(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'All Available Rides',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RideTileWidget(
                  viewModel: viewModel,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: CustomExpandableFAB(),
    );
  }
}
