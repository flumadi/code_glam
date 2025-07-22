import 'package:flutter/material.dart';
import 'package:code_glam/core/constants/app_colors.dart';
import 'package:code_glam/core/constants/app_styles.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.onConfirm,
    this.cancelText = 'Cancel',
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppStyles.headline2.copyWith(color: AppColors.secondaryColor),
      ),
      content: Text(
        message,
        style: AppStyles.bodyText1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      actions: [
        TextButton(
          onPressed: onCancel ?? () => Navigator.pop(context),
          child: Text(
            cancelText,
            style: AppStyles.bodyText1.copyWith(color: AppColors.lightTextColor),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryColor,
            foregroundColor: Colors.white,
          ),
          child: Text(confirmText),
        ),
      ],
    );
  }
}