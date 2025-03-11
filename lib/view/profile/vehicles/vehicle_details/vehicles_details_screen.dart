import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/components/shimmer_widget.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/view/profile/vehicles/vehicle_details/widgets/vehicle_card.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/get_all_vehicle_view_model.dart';

class VehiclesDetailsScreen extends StatelessWidget {
  const VehiclesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetAllVehicleViewModel>(
      create: (context) => GetAllVehicleViewModel()..getAllVehicles(),
      child: Consumer<GetAllVehicleViewModel>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Vehicles',
              isLeading: true,
              isAction: false,
            ),
            body: RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: AppColors.whiteColor,
              onRefresh: () async {
                await provider.getAllVehicles();
              },
              child: Column(
                children: [
                  CustomDivider(),
                  Expanded(
                    child: provider.getAllVehicleLoading
                        ? const Center(
                            child:
                                ShimmerLoaderWidget()) // Show loader when fetching
                        : provider.vehicles.isEmpty
                            ? const Center(child: Text("No vehicles found"))
                            : NotificationListener<
                                OverscrollIndicatorNotification>(
                                onNotification: (overscroll) {
                                  overscroll.disallowIndicator();
                                  return true;
                                },
                                child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: provider.vehicles.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: VehicleCard(
                                              vehicle:
                                                  provider.vehicles[index]),
                                        ),
                                        CustomDivider(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomElevatedButton(
                      bgColor: AppColors.whiteColor,
                      textColor: AppColors.primaryColor,
                      text: 'Add New Vehicle',
                      press: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.addNewVehicleScreen,
                        );
                      },
                    ),
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
