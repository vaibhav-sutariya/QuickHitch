import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/find_one_vehicle_view_model.dart';

class DefaultVehicleCheckbox extends StatelessWidget {
  final FindOneVehicleViewModel oneProvider;
  final bool? isUpdate;
  final ValueNotifier<bool> isDefaultNotifier;

  DefaultVehicleCheckbox({
    super.key,
    required this.oneProvider,
    this.isUpdate,
  }) : isDefaultNotifier = ValueNotifier<bool>(
          isUpdate == true && oneProvider.vehicle != null
              ? oneProvider.vehicle!.isDefault ?? false
              : false,
        );

  void toggleCheckbox() {
    isDefaultNotifier.value = !isDefaultNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCheckbox,
      child: ValueListenableBuilder<bool>(
        valueListenable: isDefaultNotifier,
        builder: (context, isDefault, child) {
          return Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: isDefault ? AppColors.darkColor : Colors.transparent,
                  border: Border.all(color: AppColors.darkColor, width: 1.5),
                ),
                child: isDefault
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 8),
              const Text(
                "Set as default vehicle",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
