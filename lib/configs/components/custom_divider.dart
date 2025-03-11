import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 2),
        Divider(
          height: 1,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
