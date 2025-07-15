import 'package:flutter/material.dart';
import 'package:code_glam/core/constants/app_colors.dart';
import 'package:code_glam/core/constants/app_styles.dart';

class MoneyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? width;

  const MoneyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 8.0,
          shadowColor: AppColors.secondaryColor.withOpacity(0.3),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24.0,
                width: 24.0,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.0,
                ),
              )
            : Text(
                text,
                style: AppStyles.buttonText.copyWith(fontSize: 16.0),
              ),
      ),
    );
  }
}