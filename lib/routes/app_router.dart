import 'package:flutter/material.dart';
import 'package:code_glam/core/animations/custom_transitions.dart';
import 'package:code_glam/features/auth/presentation/screens/login_screen.dart';
import 'package:code_glam/features/auth/presentation/screens/register_screen.dart';
import 'package:code_glam/features/send_money/presentation/screens/send_money_screen.dart';
import 'package:code_glam/main.dart';
import 'route_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case RouteNames.login:
        return SlideRightTransition(page: const LoginScreen());
      case RouteNames.register:
        return ScaleTransitionRoute(page: const RegisterScreen());
      case RouteNames.sendMoney:
        return CustomRouteTransition(page: const SendMoneyScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}