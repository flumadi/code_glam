import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/buttons/money_button.dart';
import '../bloc/send_money_bloc.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Money')),
      body: BlocProvider(
        create: (context) => SendMoneyBloc(),
        child: const SendMoneyForm(),
      ),
    );
  }
}

class SendMoneyForm extends StatelessWidget {
  // ... (Form implementation from previous example)
}