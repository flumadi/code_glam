import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static const headline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const headline2 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const headline3 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const bodyText1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  );

  static const bodyText2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.lightTextColor,
  );

  static const buttonText = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const inputDecoration = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      textStyle: buttonText,
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      textStyle: buttonText.copyWith(color: AppColors.primaryColor),
    ),
  );
}