import 'package:flutter/material.dart';
import 'package:plant_app/core/themes/light_theme.dart';
import 'package:plant_app/presentation/onboarding/get_started_page.dart';

void main() {
  runApp(const PlantApp());
}

class PlantApp extends StatelessWidget {
  const PlantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlantApp',
      theme: lightThemeData, // From core/theme/light_theme.dart
      home: const GetStartedPage(), // First onboarding screen
    );
  }
}
