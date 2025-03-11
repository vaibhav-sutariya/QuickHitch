import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.title,
    required this.hintText,
    required this.focusNode,
    required this.controller,
    required this.validator,
    this.isConfirmPassword = false,
    this.onSaved,
    this.onChanged,
  });

  final String title;
  final String hintText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool isConfirmPassword;
  final String? Function(String?) validator;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscured = true;
  bool isTyping = false;
  String? errorText;

  bool hasMinLength = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialChar = false;

  void validatePassword(String value) {
    setState(() {
      isTyping = value.isNotEmpty;
      errorText = widget.validator.call(value);

      if (!widget.isConfirmPassword) {
        hasMinLength = value.length >= 8;
        hasUppercase = value.contains(RegExp(r'[A-Z]'));
        hasLowercase = value.contains(RegExp(r'[a-z]'));
        hasSpecialChar = value.contains(RegExp(r'[^A-Za-z0-9]'));
      }
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
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          focusNode: widget.focusNode,
          controller: widget.controller,
          cursorColor:
              errorText != null ? AppColors.errorColor : AppColors.primaryColor,
          obscureText: isObscured,
          onChanged: (value) {
            widget.onChanged?.call(value);
            validatePassword(value);
          },
          onSaved: widget.onSaved,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.lightColor),
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
            suffixIcon: isTyping
                ? IconButton(
                    icon: Icon(
                      isObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.lightColor,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  )
                : null,
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
        SizedBox(height: 5),
        if (isTyping && !widget.isConfirmPassword) ...[
          _buildValidationText('Must be at least 8 characters', hasMinLength),
          _buildValidationText('One uppercase letter', hasUppercase),
          _buildValidationText('One lowercase letter', hasLowercase),
          _buildValidationText('One special character', hasSpecialChar),
        ],
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildValidationText(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 6,
            color: isValid ? AppColors.successColor : AppColors.errorColor,
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isValid ? AppColors.successColor : AppColors.errorColor,
            ),
          ),
        ],
      ),
    );
  }
}
