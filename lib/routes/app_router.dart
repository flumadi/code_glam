import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../features/send_money/presentation/screens/send_money_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SendMoneyRoute.page, initial: true),
        // Other routes...
      ];
}

@RoutePage()
class SendMoneyPage extends StatelessWidget {
  const SendMoneyPage({super.key});
}