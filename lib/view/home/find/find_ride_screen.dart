import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';

class FindRideScreen extends StatelessWidget {
  const FindRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Find Ride',
        isLeading: true,
        isAction: false,
      ),
    );
  }
}
