import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/components/custom_text_field.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/view/profile/update_profile/widgets/date_picker_widget.dart';
import 'package:quick_hitch/view/profile/update_profile/widgets/gender_widget.dart';
import 'package:quick_hitch/view/profile/update_profile/widgets/profile_picker_widget.dart';
import 'package:quick_hitch/view_model/controller/profile/update_profile/update_profile_view_model.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNamecontroller = TextEditingController();
    TextEditingController lastNamecontroller = TextEditingController();
    TextEditingController bioController = TextEditingController();
    FocusNode firstNamefocusNode = FocusNode();
    FocusNode lastNamefocusNode = FocusNode();
    FocusNode bioFocusNode = FocusNode();
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Update Profile',
          isLeading: true,
          isAction: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Consumer<UpdateProfileViewModel>(
                builder: (context, provider, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ProfilePickerWidget(),
                      SizedBox(height: 20),
                      CustomTextField(
                        title: 'First Name',
                        hintText: 'Enter First Name',
                        focusNode: firstNamefocusNode,
                        controller: firstNamecontroller,
                        onChanged: provider.setFirstName,
                      ),
                      CustomTextField(
                        title: 'Last Name',
                        hintText: 'Enter Last Name',
                        focusNode: lastNamefocusNode,
                        controller: lastNamecontroller,
                        onChanged: provider.setLastName,
                      ),
                      Row(
                        children: [
                          GenderWidget(),
                          SizedBox(width: 20),
                          DatePickerWidget(),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        maxLines: 3,
                        title: 'Bio',
                        hintText: 'Write something about you...',
                        focusNode: bioFocusNode,
                        controller: bioController,
                        onChanged: provider.setbio,
                      ),
                      SizedBox(height: 40),
                      CustomElevatedButton(
                        text: provider.updateProfileLoading
                            ? 'Updating'
                            : 'Update Profile',
                        press: () async {
                          try {
                            final response = await provider.updateProfile();
                            if (response['message'] != null) {
                              Utils.flushBarSuccessMessage(
                                  response['message'].toString(), context);
                              await Future.delayed(Duration(seconds: 1));
                              Navigator.pushNamedAndRemoveUntil(context,
                                  RoutesName.bottomNavBar, (route) => false);
                            }
                            log("Update profile Response: $response");
                          } catch (e) {
                            Utils.flushBarErrorMessage(e.toString(), context);
                            log("Update Profile Error: $e");
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
