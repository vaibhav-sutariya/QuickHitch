import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/find_one_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/vehicle_mgmn_view_model.dart';

class AddPhotoWidget extends StatelessWidget {
  final FindOneVehicleViewModel oneProvider;
  final bool? isUpdate;

  const AddPhotoWidget({
    super.key,
    required this.oneProvider,
    this.isUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VehicleMgmtViewModel>(context);
    log("Is Update: $isUpdate");

    return GestureDetector(
      onTap: () {
        provider.pickImage();
      },
      child: Container(
        width: double.infinity,
        height: 164,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        child: provider.selectedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  provider.selectedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              )
            : isUpdate == true &&
                    oneProvider.vehicle != null &&
                    oneProvider.vehicle!.photo?.isNotEmpty == true
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      oneProvider.vehicle!.photo!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceholder();
                      },
                    ),
                  )
                : _buildPlaceholder(),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.image, size: 50, color: Colors.black54),
        const SizedBox(height: 8),
        Text(
          'Add Photo',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
