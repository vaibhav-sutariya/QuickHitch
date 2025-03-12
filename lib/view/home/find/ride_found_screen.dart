import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';

class RideFoundScreen extends StatelessWidget {
  const RideFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search Result',
        isLeading: true,
        isAction: false,
      ),
      body: Column(
        children: [
          CustomDivider(),
          const SizedBox(height: 20),
          const Text('Ride Found'),
        ],
      ),
    );
  }
}
