import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/view/profile/vehicles/add_new_vehicle/widgets/add_photo_widget.dart';
import 'package:quick_hitch/view/profile/vehicles/add_new_vehicle/widgets/back_seating_widget.dart';
import 'package:quick_hitch/view/profile/vehicles/add_new_vehicle/widgets/default_vehicle_checkbox.dart';
import 'package:quick_hitch/view/profile/vehicles/add_new_vehicle/widgets/luggage_selection_widget.dart';
import 'package:quick_hitch/view/profile/vehicles/add_new_vehicle/widgets/seat_selection_widget.dart';
import 'package:quick_hitch/view/profile/vehicles/add_new_vehicle/widgets/vehicle_form_widget.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/find_one_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/vehicle_mgmn_view_model.dart';

class AddNewVehicleScreen extends StatefulWidget {
  final bool? isUpdate;
  final String? vehicleId;

  const AddNewVehicleScreen({
    super.key,
    this.vehicleId,
    this.isUpdate = false,
  });

  @override
  State<AddNewVehicleScreen> createState() => _AddNewVehicleScreenState();
}

class _AddNewVehicleScreenState extends State<AddNewVehicleScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.isUpdate == true && widget.vehicleId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<FindOneVehicleViewModel>(context, listen: false)
            .findOneVehicle(widget.vehicleId!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    log("Vehicle ID: ${widget.vehicleId}");
    log("Is Update: ${widget.isUpdate}");

    return Consumer<FindOneVehicleViewModel>(
      builder: (context, provider, child) {
        log("Vehicle fetched inside AddNewVehicleScreen: ${provider.vehicle}");
        return Scaffold(
          appBar: CustomAppBar(
            title:
                widget.vehicleId == null ? 'Add New Vehicle' : 'Update Vehicle',
            isLeading: true,
            isAction: false,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomDivider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        AddPhotoWidget(
                          isUpdate: widget.isUpdate,
                          oneProvider: provider,
                        ), // Pre-fill photo
                        SizedBox(height: 20),
                        VehicleFormWidget(
                          oneProvider: provider,
                          isUpdate: widget.isUpdate,
                        ), // Pre-fill form
                        SizedBox(height: 20),
                        SeatSelectionWidget(
                          oneProvider: provider,
                          isUpdate: widget.isUpdate,
                        ), // Pre-fill seat count
                        SizedBox(height: 20),
                        BackRowSeatingWidget(
                          oneProvider: provider,
                          isUpdate: widget.isUpdate,
                        ), // Pre-fill back seating
                        SizedBox(height: 20),
                        LuggageSelectionWidget(
                          oneProvider: provider,
                          isUpdate: widget.isUpdate,
                        ), // Pre-fill luggage selection
                        SizedBox(height: 20),
                        DefaultVehicleCheckbox(
                          oneProvider: provider,
                          isUpdate: widget.isUpdate,
                        ), // Pre-fill default selection
                        SizedBox(height: 20),
                        Consumer<VehicleMgmtViewModel>(
                          builder: (context, provider, child) {
                            return CustomElevatedButton(
                              text: provider.addVehicleLoading
                                  ? (widget.vehicleId == null
                                      ? 'Adding Vehicle'
                                      : 'Updating Vehicle')
                                  : (widget.vehicleId == null
                                      ? 'Add Vehicle'
                                      : 'Update Vehicle'),
                              press: () {
                                widget.vehicleId == null
                                    ? provider.addVehicle().then((value) async {
                                        Utils.flushBarSuccessMessage(
                                            'Vehicle Added Successfully',
                                            context);
                                        await Future.delayed(
                                            const Duration(seconds: 1));
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            RoutesName.bottomNavBar,
                                            (route) => false);
                                      })
                                    : provider
                                        .updateVehicle(widget.vehicleId!)
                                        .then((value) async {
                                        Utils.flushBarSuccessMessage(
                                            'Vehicle Updated Successfully',
                                            context);
                                        await Future.delayed(
                                            const Duration(seconds: 1));
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            RoutesName.bottomNavBar,
                                            (route) => false);
                                      });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
