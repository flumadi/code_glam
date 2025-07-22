import 'package:flutter/material.dart';
import 'package:code_glam/core/constants/app_colors.dart';
import 'package:code_glam/core/constants/app_strings.dart';
import 'package:code_glam/core/widgets/buttons/money_button.dart';
import 'package:code_glam/features/auth/presentation/widgets/auth_field.dart';
import 'package:code_glam/routes/route_names.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CREATE YOUR GLAM ACCOUNT'),
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
                        'Tech-Beauty Registration',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      AuthField(
                        controller: emailController,
                        labelText: 'Developer Email',
                        prefixIcon: const Icon(Icons.email),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
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
                            return 'Please enter a passcode';
                          }
                          if (value.length < 6) {
                            return 'Passcode must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      AuthField(
                        controller: confirmPasswordController,
                        labelText: 'Confirm Passcode',
                        prefixIcon: const Icon(Icons.lock_outline),
                        obscureText: true,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return 'Passcodes do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      MoneyButton(
                        text: 'REGISTER',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Handle registration logic
                            Navigator.pushNamed(context, RouteNames.sendMoney);
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.login);
                        },
                        child: const Text(
                          'Already have an account? Login',
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