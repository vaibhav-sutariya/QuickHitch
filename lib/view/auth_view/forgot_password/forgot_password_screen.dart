import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/components/custom_text_field.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/view/auth_view/custom_text.dart';
import 'package:quick_hitch/view_model/controller/auth/forgot_password/forgot_password_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ForgotPasswordViewModel>(
            builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const Text(
                'Forgot Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              CustomText(
                align: MainAxisAlignment.start,
                press: () => Navigator.pop(context),
                text: 'Sign in',
                title: 'Back to ',
                size: 16,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: 20),
              const Text(
                'We’ll send you a link to validate the password reset request on your registered email.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightColor),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                title: 'Email',
                hintText: 'Enter Email',
                focusNode: focusNode,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              provider.forgotPasswordLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomElevatedButton(
                      text: 'Send Mail',
                      press: () async {
                        try {
                          await provider.forgotPassword().then((value) {
                            log('Forgot Password Response: $value');
                            Navigator.pushNamed(
                              context,
                              RoutesName.passwordResetLinkScreen,
                              arguments: emailController.text,
                            );
                          });
                        } catch (error) {
                          log('Error: $error');
                        }
                      },
                    ),
            ],
          );
        }),
      ),
    );
  }
}
