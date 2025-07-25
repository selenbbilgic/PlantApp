import 'package:flutter/material.dart';
import 'package:plant_app/core/themes/light_theme.dart';
import 'package:plant_app/presentation/onboarding/get_started_page.dart';
import 'package:plant_app/routes/app_routing.dart';

void main() {
  runApp(PlantApp());
}

class PlantApp extends StatelessWidget {
  PlantApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PlantApp',
      theme: lightThemeData, // From core/theme/light_theme.dart
      routerConfig: _appRouter.config(),
    );
  }
}
