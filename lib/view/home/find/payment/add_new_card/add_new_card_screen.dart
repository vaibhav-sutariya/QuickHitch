import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/components/custom_text_field.dart';
import 'package:quick_hitch/configs/utils.dart';
import 'package:quick_hitch/view/home/find/payment/add_new_card/widgets/date_cvv_widgets/date_cvv_widget.dart';
import 'package:quick_hitch/view_model/controller/home/add_new_card_view_model.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});
  void _validateAndSave(BuildContext context, AddNewCardViewModel viewModel) {
    if (viewModel.cardNumber.isEmpty ||
        viewModel.expiryDate == null ||
        viewModel.cvv.isEmpty ||
        viewModel.postalCode.isEmpty ||
        viewModel.cardHolderName.isEmpty) {
      // Show error message if any field is empty
      Utils.flushBarErrorMessage(
          'Please fill in all fields before proceeding.', context);
    } else {
      // Save the card details
      // viewModel.saveCardDetails(context);
    }
  }

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
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<AddNewCardViewModel>(
                builder: (context, addNewCardViewModel, child) {
                  return Column(
                    children: [
                      CustomDivider(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            CustomTextField(
                              title: 'Card Number',
                              hintText: '0000 0000 0000 0000',
                              onChanged: (value) {
                                addNewCardViewModel.onCardNumberChanged(value);
                              },
                            ),
                            DateCvvWidget(
                                addNewCardViewModel: addNewCardViewModel),
                            SizedBox(height: 16),
                            CustomTextField(
                              title: 'Postal Code',
                              hintText: 'A1B D3C',
                              onChanged: (value) {
                                addNewCardViewModel.postalCode = value;
                              },
                            ),
                            CustomTextField(
                              title: 'Card Holder Name',
                              hintText: 'Enter Card Holder Name',
                              onChanged: (value) {
                                addNewCardViewModel.cardHolderName = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<AddNewCardViewModel>(
              builder: (context, addNewCardViewModel, child) {
                return CustomElevatedButton(
                  text: 'Save',
                  press: () {
                    _validateAndSave(context, addNewCardViewModel);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
