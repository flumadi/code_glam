import 'package:flutter/material.dart';
import 'package:code_glam/core/constants/app_colors.dart';
import 'package:code_glam/core/constants/app_strings.dart';
import 'package:code_glam/core/constants/app_styles.dart';
import 'package:code_glam/core/widgets/buttons/money_button.dart';
import 'package:code_glam/core/widgets/dialogs/confirmation_dialog.dart';
import 'package:code_glam/features/send_money/presentation/widgets/amount_field.dart';
import 'package:code_glam/features/send_money/presentation/widgets/recipient_field.dart';
import 'package:code_glam/routes/route_names.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedPaymentMethod;
  bool isFavorite = false;

  final List<String> paymentMethods = [
    'Glam Coin',
    'Tech Token',
    'Beauty Bucks',
    'Code Cash',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.sendMoneyTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.welcome, (route) => false);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              RecipientField(
                controller: recipientController,
                labelText: AppStrings.recipientName,
                prefixIcon: const Icon(Icons.person, color: AppColors.primaryColor),
              ),
              const SizedBox(height: 20),
              AmountField(
                controller: amountController,
                labelText: AppStrings.amount,
                prefixIcon: const Icon(Icons.attach_money, color: AppColors.primaryColor),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedPaymentMethod,
                decoration: InputDecoration(
                  labelText: AppStrings.paymentMethod,
                  prefixIcon: const Icon(Icons.payment, color: AppColors.primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: paymentMethods
                    .map((method) => DropdownMenuItem(
                          value: method,
                          child: Text(method),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a payment method';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text(AppStrings.favoriteTransaction),
                value: isFavorite,
                onChanged: (value) {
                  setState(() {
                    isFavorite = value;
                  });
                },
                activeColor: AppColors.primaryColor,
              ),
              const SizedBox(height: 40),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: MoneyButton(
                  text: AppStrings.send,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => ConfirmationDialog(
                          title: 'Confirm Transaction',
                          message:
                              'Send ${amountController.text} to ${recipientController.text}?',
                          confirmText: 'Confirm',
                          cancelText: 'Cancel',
                          onConfirm: () {
                            // Handle transaction logic
                            _showSuccessMessage(context);
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.transactionSuccess),
        content: const Icon(Icons.check_circle, color: AppColors.successColor, size: 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}