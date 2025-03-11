import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/view/profile/update_travel_preferences/widgets/preference_tile.dart';
import 'package:quick_hitch/view_model/controller/profile/update_travel_preferences/update_travel_preferences_view_model.dart';

class UpdateTravelPreferencesScreen extends StatelessWidget {
  const UpdateTravelPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Travel Preferences', isLeading: true, isAction: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomDivider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PreferenceTile(icon: AntDesign.message1, label: "Conversation"),
                PreferenceTile(icon: AntDesign.sound, label: "Music"),
                PreferenceTile(icon: Icons.pets_rounded, label: "Pet"),
                PreferenceTile(
                    icon: Icons.smoking_rooms_outlined, label: "Smoking"),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Consumer<UpdateTravelPreferencesViewModel>(
                    builder: (context, provider, child) {
                      return CustomElevatedButton(
                        text: provider.updateTravelProfileLoading
                            ? 'Updating'
                            : 'Update Preferences',
                        press: () {
                          provider
                              .updateTravelPreferences()
                              .then((value) async {
                            Utils.flushBarSuccessMessage(
                                'Travel Preferences update successfully',
                                context);
                            await Future.delayed(Duration(seconds: 1));
                            Navigator.pushNamedAndRemoveUntil(context,
                                RoutesName.bottomNavBar, (route) => false);
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
