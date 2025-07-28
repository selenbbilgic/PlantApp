import 'package:flutter/material.dart';

class DiagnoseView extends StatelessWidget {
  const DiagnoseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diagnose')),
      body: Center(
        child: Text(
          'Diagnose',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
