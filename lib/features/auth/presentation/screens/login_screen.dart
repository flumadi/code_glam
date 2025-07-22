import 'package:flutter/material.dart';
import 'package:code_glam/core/constants/app_colors.dart';
import 'package:code_glam/core/constants/app_strings.dart';
import 'package:code_glam/core/constants/app_styles.dart';
import 'package:code_glam/core/widgets/buttons/money_button.dart';
import 'package:code_glam/features/auth/presentation/widgets/auth_field.dart';
import 'package:code_glam/routes/route_names.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACCESS YOUR GLAM SPACE'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.shade100,
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Text(
                        AppStrings.loginTitle,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      AuthField(
                        controller: emailController,
                        labelText: AppStrings.developerId,
                        prefixIcon: const Icon(Icons.code),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Developer ID';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      AuthField(
                        controller: passwordController,
                        labelText: AppStrings.glamPasscode,
                        prefixIcon: const Icon(Icons.lock),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your passcode';
                          }
                          if (value.length < 6) {
                            return 'Passcode must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: MoneyButton(
                              text: AppStrings.login,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  // Handle login logic
                                  Navigator.pushNamed(
                                      context, RouteNames.sendMoney);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteNames.register);
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: AppColors.secondaryColor),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                AppStrings.register,
                                style: TextStyle(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          // Handle forgot password
                        },
                        child: const Text(
                          AppStrings.forgotPassword,
                          style: TextStyle(color: AppColors.accentColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                AppStrings.quote,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: AppColors.accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}