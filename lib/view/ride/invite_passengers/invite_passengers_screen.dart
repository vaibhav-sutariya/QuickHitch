import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';

class InvitePassengersScreen extends StatelessWidget {
  const InvitePassengersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Invite passengers', isLeading: true, isAction: false),
      body: Column(
        children: [
          CustomDivider(),
        ],
      ),
    );
  }
}
