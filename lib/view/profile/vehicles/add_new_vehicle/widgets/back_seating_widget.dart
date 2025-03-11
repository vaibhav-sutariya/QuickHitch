import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/find_one_vehicle_view_model.dart';
import 'package:quick_hitch/view_model/controller/profile/vehicle/vehicle_mgmn_view_model.dart';

class BackRowSeatingWidget extends StatefulWidget {
  final FindOneVehicleViewModel oneProvider;
  final bool? isUpdate;

  const BackRowSeatingWidget({
    super.key,
    required this.oneProvider,
    this.isUpdate,
  });

  @override
  _BackRowSeatingWidgetState createState() => _BackRowSeatingWidgetState();
}

class _BackRowSeatingWidgetState extends State<BackRowSeatingWidget> {
  late int selectedSeats; // Track the selected option

  @override
  void initState() {
    super.initState();
    // Initialize selectedSeats with the existing vehicle data if updating
    selectedSeats =
        widget.isUpdate == true && widget.oneProvider.vehicle != null
            ? widget.oneProvider.vehicle!.backRowSeating ?? 2
            : 2; // Default value is 2 seats
  }

  @override
  Widget build(BuildContext context) {
    final seatingViewModel = Provider.of<VehicleMgmtViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Back Row Seating",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Keep back-row seating limited to ensure safety and comfort.",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.lightColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blueGrey.shade800, width: 1.5),
          ),
          child: Row(
            children: [
              _buildOption(context, "Max 2 People", Icons.event_seat, 2,
                  seatingViewModel),
              _buildOption(context, "Max 3 People", Icons.event_seat, 3,
                  seatingViewModel),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOption(BuildContext context, String text, IconData icon,
      int value, VehicleMgmtViewModel model) {
    bool isSelected = selectedSeats == value;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSeats = value;
          });
          model.updateSelection(value);
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.darkColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: isSelected ? AppColors.whiteColor : AppColors.darkColor,
              ),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color:
                      isSelected ? AppColors.whiteColor : AppColors.darkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
