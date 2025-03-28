import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';

class MatchingRidesScreen extends StatelessWidget {
  final String requestId;

  const MatchingRidesScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    log('Request ID: $requestId');
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Matching Rides', isLeading: true, isAction: false),
    );
  }
}
