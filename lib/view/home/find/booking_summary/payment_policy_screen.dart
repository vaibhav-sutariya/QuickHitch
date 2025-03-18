import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';

class PaymentPolicyScreen extends StatelessWidget {
  const PaymentPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Booking Summary', isLeading: true, isAction: false),
      body: Column(
        children: [
          CustomDivider(),
        ],
      ),
    );
  }
}
