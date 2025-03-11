import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_text_field.dart';
import 'package:quick_hitch/configs/responsive.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/find_one_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/vehicle_mgmn_view_model.dart';

class VehicleFormWidget extends StatelessWidget {
  final FindOneVehicleViewModel oneProvider;
  final bool? isUpdate;

  const VehicleFormWidget({
    super.key,
    required this.oneProvider,
    this.isUpdate,
  });

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    // final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    // final double padding = screenWidth * 0.05;

    return Consumer<VehicleMgmtViewModel>(
      builder: (context, provider, child) {
        String? selectedMake = isUpdate == true
            ? oneProvider.vehicle?.make?.name
            : provider.makes.isNotEmpty
                ? provider.makes.first.name
                : null;
        String? modelName =
            isUpdate == true ? oneProvider.vehicle?.modelName : "";
        String? selectedColor = isUpdate == true &&
                provider.colors.contains(oneProvider.vehicle?.color)
            ? oneProvider.vehicle?.color
            : provider.colors.isNotEmpty
                ? provider.colors.first
                : null;

        String? selectedYear = isUpdate == true
            ? oneProvider.vehicle?.makeYear?.toString()
            : provider.years.isNotEmpty
                ? provider.years.first
                : null;
        String? registrationNumber =
            isUpdate == true ? oneProvider.vehicle?.registrationNumber : "";

        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    children: [
                      Expanded(
                        child: FutureBuilder(
                          future: provider.makes.isEmpty
                              ? provider.fetchMakes()
                              : null,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasError) {
                              return const Text("Error loading makes");
                            }
                            return _buildDropdownField(
                              context,
                              label: "Make",
                              value: selectedMake,
                              items: provider.makes.map((e) => e.name).toList(),
                              onChanged: (String? value) {
                                if (value != null) {
                                  final make = provider.makes
                                      .firstWhere((make) => make.name == value);
                                  provider.updateMake(make);
                                }
                                log('Selected Make: ${provider.selectedMake?.name}');
                                log('Selected Make ID: ${provider.selectedMake?.id}');
                              },
                              textScaleFactor: getTextScale(context),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: getScreenWidth(context) * 0.03),
                      Expanded(
                        child: CustomTextField(
                          title: 'Model',
                          initialValue: modelName,
                          onChanged: provider.updateModelName,
                          hintText: 'Model',
                          // textScaleFactor: textScaleFactor,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: getScreenWidth(context) * 0.02),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    children: [
                      Expanded(
                        child: _buildDropdownField(
                          context,
                          label: "Color",
                          value: selectedColor,
                          items: provider.colors.toSet().toList(),
                          onChanged: provider.updateColor,
                          textScaleFactor: getTextScale(context),
                        ),
                      ),
                      SizedBox(width: getScreenWidth(context) * 0.03),
                      Expanded(
                        child: _buildDropdownField(
                          context,
                          label: "Year",
                          value: selectedYear,
                          items: provider.years,
                          onChanged: (value) =>
                              provider.updateMakeYear(int.tryParse(value!)),
                          textScaleFactor: getTextScale(context),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: getScreenHeight(context) * 0.02),
              CustomTextField(
                title: 'Registration Number',
                initialValue: registrationNumber,
                onChanged: provider.updateRegistrationNumber,
                hintText: 'Registration Number',
                // textScaleFactor: textScaleFactor,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropdownField(BuildContext context,
      {required String label,
      String? value,
      required List<String> items,
      required Function(String?) onChanged,
      required double textScaleFactor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12 * textScaleFactor,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: value,
          items: items
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e,
                        style: TextStyle(fontSize: 14 * textScaleFactor)),
                  ))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide:
                  BorderSide(color: AppColors.focusBorderColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: AppColors.borderColor, width: 1),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
