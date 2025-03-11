import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.focusNode,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.maxLines,
    this.initialValue,
    this.isPrefix,
  });

  final String title;
  final String hintText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLines;
  final String? initialValue;
  final bool? isPrefix;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;

  void validate() {
    setState(() {
      errorText = widget.validator?.call(widget.controller?.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 12,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 5),
        TextFormField(
          maxLines: widget.maxLines,
          focusNode: widget.focusNode,
          controller: widget.controller,
          initialValue: widget.initialValue,
          cursorColor:
              errorText != null ? AppColors.errorColor : AppColors.primaryColor,
          onSaved: widget.onSaved,
          onChanged: (value) {
            widget.onChanged?.call(value);
            validate();
          },
          // validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.lightColor),
            prefixIcon: widget.isPrefix == true
                ? Icon(Icons.attach_money, color: AppColors.lightColor)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                  color: errorText != null
                      ? AppColors.errorColor
                      : AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                  color: errorText != null
                      ? AppColors.errorColor
                      : AppColors.focusBorderColor,
                  width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                  color: errorText != null
                      ? AppColors.errorColor
                      : AppColors.borderColor,
                  width: 1),
            ),
            errorText: null,
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              errorText!,
              style: TextStyle(color: AppColors.errorColor, fontSize: 12),
            ),
          ),
        SizedBox(height: 20),
      ],
    );
  }
}
