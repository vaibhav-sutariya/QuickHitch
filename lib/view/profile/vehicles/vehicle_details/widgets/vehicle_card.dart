import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/vehicles/vehicle_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/delete_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/get_all_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/vehicle_mgmn_view_model.dart';

class VehicleList extends StatelessWidget {
  const VehicleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GetAllVehicleViewModel>(
      builder: (context, vehicleViewModel, child) {
        if (vehicleViewModel.getAllVehicleLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final vehicles = vehicleViewModel.vehicles;
        if (vehicles.isEmpty) {
          return const Center(child: Text("No vehicle data available"));
        }

        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: VehicleCard(vehicle: vehicles[index]),
                  ),
                  CustomDivider(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class VehicleCard extends StatelessWidget {
  final VehicleModel vehicle;
  const VehicleCard({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            vehicle.isDefault ?? false
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Default Vehicle",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
                : SizedBox.shrink(),
            Row(
              children: [
                Consumer<VehicleMgmtViewModel>(
                    builder: (context, updateVehicleViewModel, child) {
                  return IconButton(
                      onPressed: () {
                        // updateVehicleViewModel.updateVehicle(vehicle.id!);
                        Navigator.pushNamed(
                          context,
                          RoutesName.addNewVehicleScreen,
                          arguments: vehicle,
                        );
                      },
                      icon: Icon(Icons.edit));
                }),
                Consumer<DeleteVehicleViewModel>(
                    builder: (context, deleteVehicleViewModel, child) {
                  return IconButton(
                      onPressed: () {
                        deleteVehicleViewModel.deleteVehicle(vehicle.id!);
                      },
                      icon: Icon(Icons.delete));
                }),
              ],
            )
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                vehicle.photo ??
                    'https://w7.pngwing.com/pngs/602/266/png-transparent-add-image-icon.png',
                width: 156,
                height: 78,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${vehicle.make!.name}, ${vehicle.modelName} (${vehicle.makeYear ?? ''})",
                    style: const TextStyle(
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Maximum ${vehicle.noOfSeats ?? 'N/A'} seats",
                    style: const TextStyle(
                      color: AppColors.lightColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    vehicle.registrationNumber ?? "N/A",
                    style: const TextStyle(
                      color: AppColors.lightColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
