import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/view/profile/vehicles/vehicle_details/widgets/vehicle_card.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/get_all_vehicle_view_model.dart';

class VehiclesDetailsScreen extends StatefulWidget {
  const VehiclesDetailsScreen({super.key});

  @override
  State<VehiclesDetailsScreen> createState() => _VehiclesDetailsScreenState();
}

class _VehiclesDetailsScreenState extends State<VehiclesDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAllVehicleViewModel>(context, listen: false)
          .getAllVehicles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetAllVehicleViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Vehicles',
            isLeading: true,
            isAction: false,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await provider.getAllVehicles(); // Fetch updated vehicle data
            },
            child: Column(
              children: [
                CustomDivider(),
                Expanded(
                  child: provider.getAllVehicleLoading
                      ? const Center(
                          child:
                              CircularProgressIndicator()) // Show loader when fetching
                      : provider.vehicles.isEmpty
                          ? const Center(child: Text("No vehicles found"))
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: provider.vehicles.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: VehicleCard(
                                          vehicle: provider.vehicles[index]),
                                    ),
                                    CustomDivider(),
                                  ],
                                );
                              },
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
    );
  }
}
