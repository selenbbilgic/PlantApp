import 'package:flutter/material.dart';

class GardenView extends StatelessWidget {
  const GardenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Garden')),
      body: Center(
        child: Text(
          'User Garden',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
