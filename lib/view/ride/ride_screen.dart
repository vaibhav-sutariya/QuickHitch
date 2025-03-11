import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/shimmer_widget.dart';
import 'package:quick_hitch/view/ride/widgets/ride_toggle.dart';
import 'package:quick_hitch/view/ride/widgets/ride_widget.dart';
import 'package:quick_hitch/view_model/controller/rides/get_all_rides_view_model.dart';

class MyRideScreen extends StatelessWidget {
  const MyRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetAllRidesViewModel>(
      create: (context) => GetAllRidesViewModel()..getRides(),
      child: Consumer<GetAllRidesViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: CustomAppBar(
              isLeading: false,
              isAction: true,
              title: 'Rides',
            ),
            body: RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: AppColors.whiteColor,
              onRefresh: () async {
                await viewModel.getRides();
              },
              child: Column(
                children: [
                  CustomDivider(),
                  RideToggleWidget(),
                  SizedBox(height: 10),
                  Expanded(
                    child: viewModel.getRidesLoading
                        ? const Center(child: ShimmerLoaderWidget())
                        : RideTileWidget(viewModel: viewModel),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
