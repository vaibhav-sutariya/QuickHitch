import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/model/vehicles/vehicle_model.dart';
import 'package:quick_hitch/view_model/controller/home/post_ride_view_model.dart';

class VehicleDropdownView extends StatelessWidget {
  const VehicleDropdownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostRideViewModel>(
      builder: (context, vehicleViewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vehicle",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkColor),
            ),
            SizedBox(height: 8),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.blackColor, width: 1.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<VehicleModel>(
                  value:
                      vehicleViewModel.selectedVehicle?.modelName.toString() ==
                              ""
                          ? null
                          : vehicleViewModel.selectedVehicle,
                  isDense: true,
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down,
                      color: AppColors.darkColor),
                  style: TextStyle(fontSize: 14, color: AppColors.darkColor),
                  onChanged: (VehicleModel? newValue) {
                    if (newValue != null) {
                      vehicleViewModel.setSelectedVehicle(newValue);
                    }
                  },
                  items: vehicleViewModel.vehicles.map((VehicleModel vehicle) {
                    return DropdownMenuItem<VehicleModel>(
                      value:
                          vehicle.modelName.toString() == "" ? null : vehicle,
                      child: Text(
                          "${vehicle.make?.name} ${vehicle.modelName} (${vehicle.makeYear})"),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "${vehicleViewModel.selectedVehicle?.make?.name} ${vehicleViewModel.selectedVehicle?.modelName} (${vehicleViewModel.selectedVehicle?.makeYear.toString()})",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightColor),
            ),
            SizedBox(height: 10),
            Text(
              vehicleViewModel.selectedVehicle?.registrationNumber ??
                  "GJ01FW1234",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightColor),
            ),
          ],
        );
      },
    );
  }
}
