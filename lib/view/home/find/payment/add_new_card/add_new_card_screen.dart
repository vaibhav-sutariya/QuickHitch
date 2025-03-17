import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_text_field.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add a New Card',
        isLeading: true,
        isAction: false,
      ),
      body: Column(
        children: [
          CustomDivider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextField(
                  title: 'Card Number',
                  hintText: '0000 0000 0000 0000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
