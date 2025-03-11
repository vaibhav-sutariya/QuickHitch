import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custome_social_button.dart';
import 'package:quick_hitch/configs/components/logo_widget.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/view/auth_view/custom_text.dart';
import 'package:quick_hitch/view_model/controller/auth/social_sign_in/apple_sign_in.dart';
import 'package:quick_hitch/view_model/controller/auth/social_sign_in/facebook_sign_in.dart';
import 'package:quick_hitch/view_model/controller/auth/social_sign_in/google_sign_in.dart';

class SigninWelcomeScreen extends StatelessWidget {
  const SigninWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            LogoWidget(),
            SizedBox(
              height: 5,
            ),
            Text(
              'Sign In With',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Consumer<GoogleSignInProvider>(
              builder: (context, provider, child) {
                return CustomeSocialButton(
                  press: () async {
                    final user = await provider.googleSignIn();
                    if (user != null) {
                      Utils.flushBarSuccessMessage(
                          'Sign in with Google Successfull', context);
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesName.bottomNavBar, (route) => false);
                    }
                  },
                  text: provider.googleSignInLoading
                      ? 'Loading...'
                      : 'Sign in with Google',
                  iconPath: 'assets/icons/google.svg',
                );
              },
            ),
            Consumer<FacebookSignInProvider>(
              builder: (context, provider, child) {
                return CustomeSocialButton(
                  press: () async {
                    final user = await provider.facebookSignIn();
                    if (user != null) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesName.home, (route) => false);
                    }
                  },
                  text: provider.facebookSignInLoading
                      ? 'Loading...'
                      : 'Sign in with Facebook',
                  iconPath: 'assets/icons/facebook.svg',
                );
              },
            ),
            Consumer<AppleSignIn>(
              builder: (context, provider, child) {
                return CustomeSocialButton(
                  press: () async {
                    await provider.appleSignIn();
                  },
                  text: provider.appleSignInLoading
                      ? 'Loading...'
                      : 'Sign in with Apple',
                  iconPath: 'assets/icons/apple.svg',
                );
              },
            ),
            CustomeSocialButton(
              press: () {
                Navigator.pushNamed(context, RoutesName.emailSignIn);
              },
              text: 'Sign in with Email',
              iconPath: 'assets/icons/email.svg',
            ),
            CustomText(
              align: MainAxisAlignment.center,
              press: () => Navigator.pushNamedAndRemoveUntil(
                  context, RoutesName.signUp, (route) => false),
              text: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
