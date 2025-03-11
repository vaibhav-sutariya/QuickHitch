import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/profile/update_profile/update_profile_view_model.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UpdateProfileViewModel>(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Gender",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(35),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: userViewModel.selecteGender,
                icon: const Icon(Icons.keyboard_arrow_down),
                isExpanded: true,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    userViewModel.setGender(newValue);
                  }
                },
                items: userViewModel.genderOptions.map((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: AppColors.lightColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ));
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
