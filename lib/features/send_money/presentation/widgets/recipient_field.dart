import 'package:flutter/material.dart';
import 'package:code_glam/core/constants/app_colors.dart';

class RecipientField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget prefixIcon;
  final String? Function(String?)? validator;

  const RecipientField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter recipient name';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
        fillColor: Colors.white,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppColors.errorColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppColors.secondaryColor),
        ),
      ),
    );
  }
}