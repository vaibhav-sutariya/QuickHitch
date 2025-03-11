import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/assets/image_assets.dart';
import 'package:quick_hitch/view_model/controller/profile/update_profile/update_profile_view_model.dart';

class ProfilePickerWidget extends StatelessWidget {
  const ProfilePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UpdateProfileViewModel>(context);

    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () async {
          await userViewModel.pickImage();
        },
        child: CircleAvatar(
          radius: 70,
          backgroundImage: userViewModel.profileImage != null
              ? FileImage(userViewModel.profileImage!)
              : AssetImage(ImageAssets.avatar) as ImageProvider,
        ),
      ),
    );
  }
}
