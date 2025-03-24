import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/configs/components/custom_elevated_button.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/model/home/search_ride_model.dart';
import 'package:quick_hitch/view/home/find/payment/add_new_card/widgets/date_cvv_widgets/card_widget.dart';
import 'package:quick_hitch/view_model/controller/home/card_view_model/get_cards_view_model.dart';

class PaymentScreen extends StatelessWidget {
  final Rides ride;
  const PaymentScreen({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    log('PaymentScreen: ${ride.origin.toString()}');
    return ChangeNotifierProvider(
      create: (context) => GetCardsViewModel()..getAllCards(),
      child: Consumer<GetCardsViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Payment',
              isLeading: true,
              isAction: false,
            ),
            body: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    backgroundColor: AppColors.whiteColor,
                    onRefresh: () async {
                      await viewModel.getAllCards();
                    },
                    child: ListView(
                      padding: EdgeInsets.zero, // Ensure full scrollability
                      physics:
                          AlwaysScrollableScrollPhysics(), // Enables pull-to-refresh
                      children: [
                        CustomDivider(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Select card for payment'),
                        ),
                        CardWidget(viewModel: viewModel),
                        SizedBox(height: 10),

                        CustomDivider(),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextButton.icon(
                              onPressed: () => Navigator.pushNamed(
                                context,
                                RoutesName.addNewCardScreen,
                              ),
                              label: Text(
                                'Add new card',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.darkColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              icon: Icon(
                                Icons.add,
                                color: AppColors.darkColor,
                                size: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        CustomDivider(),
                        SizedBox(height: 16), // Prevent button from overlapping
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomElevatedButton(
                    text: 'Next',
                    press: () {
                      if (viewModel.selectedCardId != null) {
                        final selectedCard =
                            viewModel.cardModel?.data?.firstWhere(
                          (card) => card.id == viewModel.selectedCardId,
                          // orElse: () => ,
                        );

                        if (selectedCard != null) {
                          // Navigate to BookingSummaryScreen with both ride and card
                          Navigator.pushNamed(
                            context,
                            RoutesName.bookingSummaryScreen,
                            arguments: {
                              'ride': ride,
                              'card': selectedCard,
                            },
                          );
                        } else {
                          // Show error if no card is selected
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select a card for payment'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      } else {
                        // Show error if no card is selected
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select a card for payment'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
