import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/components/custom_password_field.dart';
import 'package:quick_hitch/configs/components/custom_text_field.dart';
import 'package:quick_hitch/configs/components/logo_widget.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/view/auth_view/custom_text.dart';
import 'package:quick_hitch/view/auth_view/widgets/forgot_password_text.dart';
import 'package:quick_hitch/view_model/controller/auth/login/login_view_model.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final FocusNode emailFocusNode = FocusNode();

  final FocusNode passwordFocusNode = FocusNode();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          child: Consumer<LoginViewModel>(
            builder: (context, provider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // spacing: 5,
                  children: [
                    LogoWidget(),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      title: 'Email',
                      hintText: 'Enter Email',
                      focusNode: emailFocusNode,
                      controller: emailController,
                      onChanged: provider.setEmail,
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
                    ),
                    CustomPasswordField(
                      isConfirmPassword: true,
                      title: 'Password',
                      hintText: 'Enter Password',
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      onChanged: provider.setPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    ForgotPasswordText(),
                    SizedBox(
                      height: 20,
                    ),
                    CustomElevatedButton(
                        text:
                            provider.loginLoading ? 'Signing In...' : 'Sign In',
                        press: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _formKey.currentState!.reset();
                            // if all are valid then go to success screen
                            developer.log(
                                '${emailController.text} ${passwordController.text}');

                            provider.loginUser().then((value) async {
                              Utils.flushBarSuccessMessage(
                                  'User Loggedin Successfull', context);
                              await Future.delayed(Duration(seconds: 1));
                              Navigator.pushNamedAndRemoveUntil(context,
                                  RoutesName.bottomNavBar, (route) => false);
                            }).onError((error, stackTrace) {
                              Utils.flushBarErrorMessage(
                                  'User Loggedin Failed', context);
                              developer.log('Error: $error');
                            });
                          }

                          // Navigator.pushNamed(context, RoutesName.home);
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      press: () =>
                          Navigator.pushNamed(context, RoutesName.emailSignUp),
                      text: 'Sign Up',
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
