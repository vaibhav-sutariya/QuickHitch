import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/components/custom_password_field.dart';
import 'package:quick_hitch/configs/components/custom_text_field.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/view/auth_view/custom_text.dart';
import 'package:quick_hitch/view_model/controller/auth/register/register_view_model.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Consumer<RegisterViewModel>(
            builder: (context, provider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 25),
                    CustomTextField(
                      title: 'First Name',
                      hintText: 'Enter First Name',
                      focusNode: firstNameFocusNode,
                      controller: firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First name cannot be empty';
                        }
                        return null;
                      },
                      onChanged: provider.setFirstname,
                    ),
                    CustomTextField(
                      title: 'Last Name',
                      hintText: 'Enter Last Name',
                      focusNode: lastNameFocusNode,
                      controller: lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Last name cannot be empty';
                        }
                        return null;
                      },
                      onChanged: provider.setLastname,
                    ),
                    CustomTextField(
                      title: 'Email',
                      hintText: 'Enter Email',
                      focusNode: emailFocusNode,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                      onChanged: provider.setEmail,
                    ),
                    CustomPasswordField(
                      title: 'Password',
                      hintText: 'Enter Password',
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        return null;
                      },
                      onChanged: provider.setPassword,
                    ),
                    CustomPasswordField(
                      isConfirmPassword: true,
                      title: 'Confirm Password',
                      hintText: 'Re-enter Password',
                      focusNode: confirmPasswordFocusNode,
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password cannot be empty';
                        } else if (passwordController.text != value) {
                          return 'Password doesn\'t match';
                        }
                        return null;
                      },
                    ),
                    Text(
                      'By creating an account, you agree to our Terms and acknowledge the Privacy Policy.',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomElevatedButton(
                      text: provider.registerLoading
                          ? 'Signing Up...'
                          : 'Sign Up',
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _formKey.currentState!.reset();

                          provider.registerUser().then((isSuccess) async {
                            Utils.flushBarSuccessMessage(
                                'User registered successfully', context);
                            await Future.delayed(Duration(seconds: 1));
                            Navigator.pushNamed(
                              context,
                              RoutesName.emailSignIn,
                            );
                          }).catchError((error) {
                            developer.log('Register Error: $error');
                          });
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      title: 'Already have an account?',
                      press: () =>
                          Navigator.pushNamed(context, RoutesName.emailSignIn),
                      text: 'Sign in',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
