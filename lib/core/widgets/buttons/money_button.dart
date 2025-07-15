import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class MoneyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const MoneyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primary,
        padding: AppStyles.buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: AppStyles.borderRadius,
        ),
      ),
      child: Text(
        text,
        style: AppStyles.buttonText,
      ),
    );
  }
}