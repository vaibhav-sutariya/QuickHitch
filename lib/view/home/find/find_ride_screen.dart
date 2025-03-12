import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/components/custom_app_bar.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view/home/find/widgets/date_picker_widget.dart';
import 'package:quick_hitch/view/home/find/widgets/text_fields_widget.dart';
import 'package:quick_hitch/view_model/controller/home/search_ride_view_model.dart';

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
      body: Consumer<SearchRideViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDivider(),
              TextFieldsWidget(),
              CustomDivider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Departure Date (Optional)',
                      style: TextStyle(
                        color: const Color(0xFF334155),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 50, child: DatePicker()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
