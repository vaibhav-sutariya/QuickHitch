import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/components/custom_password_field.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/view_model/controller/profile/change_password/change_password_view_model.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final reEnterPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    final FocusNode oldPasswordFocusnode = FocusNode();
    final FocusNode newPasswordFocusnode = FocusNode();
    final FocusNode confirmPasswordFocusnode = FocusNode();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Change Password',
        isLeading: true,
        isAction: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Consumer<ChangePasswordViewModel>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Change Password',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 30),
                    CustomPasswordField(
                      isConfirmPassword: true,
                      title: 'Old Password',
                      hintText: 'Enter Old Password',
                      controller: oldPasswordController,
                      validator: (value) => value!.isEmpty
                          ? 'Old Password cannot be empty'
                          : null,
                      focusNode: oldPasswordFocusnode,
                      onChanged: provider.setOldPassword,
                    ),
                    CustomPasswordField(
                      title: 'New Password',
                      hintText: 'Enter New Password',
                      controller: newPasswordController,
                      validator: (value) => value!.isEmpty
                          ? 'New Password cannot be empty'
                          : null,
                      focusNode: newPasswordFocusnode,
                      onChanged: provider.setnewPassowrd,
                    ),
                    CustomPasswordField(
                      isConfirmPassword: true,
                      title: 'Confirm Password',
                      hintText: 'Re-enter Password',
                      controller: reEnterPasswordController,
                      focusNode: confirmPasswordFocusnode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Confirm Password cannot be empty';
                        } else if (newPasswordController.text != value) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                      text: provider.changePasswordLoading
                          ? 'Updating...'
                          : 'Update Password',
                      press: () async {
                        if (!formKey.currentState!.validate()) return;
                        formKey.currentState!.reset();

                        formKey.currentState!.save();

                        try {
                          final response = await provider.changePassword();
                          if (response['message'] != null) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RoutesName.bottomNavBar, (route) => false);
                            Utils.flushBarSuccessMessage(
                                response['message'].toString(), context);
                          }
                          log("Change Password Response: $response");
                        } catch (e) {
                          Utils.flushBarErrorMessage(e.toString(), context);
                          log("Change Password Error: $e");
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
