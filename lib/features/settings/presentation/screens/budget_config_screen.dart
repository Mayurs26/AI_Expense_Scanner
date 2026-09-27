import 'package:flutter/material.dart';

class BudgetConfigScreen extends StatelessWidget {
  const BudgetConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Budget Config')),
      body: const Center(child: Text('Budget Configuration')),
    );
  }
}
