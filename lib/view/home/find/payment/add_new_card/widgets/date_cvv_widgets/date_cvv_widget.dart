import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/add_new_card_view_model.dart';

class DateCvvWidget extends StatelessWidget {
  final AddNewCardViewModel addNewCardViewModel;
  const DateCvvWidget({super.key, required this.addNewCardViewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Expiry Date',
                style: TextStyle(
                    fontSize: 12,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'MM/YY',
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: AppColors.lightColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                    ),
                  ),
                ),
                onTap: () => addNewCardViewModel.selectExpiryDate(context),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Security Code',
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                obscureText: true,
                onChanged: (value) {
                  addNewCardViewModel.cvv = value;
                },
                decoration: InputDecoration(
                  hintText: 'CVC',
                  counterText: '',
                  suffixIcon: Tooltip(
                    message: '3-digit security code on the back of your card',
                    child: Icon(
                      Icons.help_outline,
                      color: AppColors.lightColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
