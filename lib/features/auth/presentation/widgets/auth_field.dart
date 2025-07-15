import 'package:flutter/material.dart';
import 'package:code_glam/core/constants/app_colors.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const AuthField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: const Color(0xFFF8BBD0),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.errorColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.secondaryColor),
        ),
      ),
    );
  }
}