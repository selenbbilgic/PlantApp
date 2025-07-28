import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Roboto',
  primaryColor: Color(0xFF2CCC80B), // Plant green
  colorScheme: ColorScheme.light(
    primary: Color(0xFF28AF6E), // Green buttons
    tertiary: Color(0xFF597165),
    secondary: Color(0xFFBDBDBD), // Light gray for backgrounds/cards
    onPrimary: Colors.white, // Text on green button
    onSecondary: Colors.black, // Text on secondary bg
    surface: Color(0xFFFBFAFA),
    inverseSurface: Color(0xFF101E17),
    onSurface: Color.fromARGB(255, 255, 255, 255), // Dark text on surface
    onInverseSurface: Color(0xFF24201A), // Dark text on inverse surface
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Color(0xFF13231B),
    ),
    displayLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Color(0xFFFFFFFF),
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFF13231B),
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFF13231B),
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 9,
      color: Colors.white.withAlpha(150),
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Color(0xFFFFFFFF),
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ), // For buttons
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF00A86B), // Green
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF5F5F5),

    // This is your “idle” state border
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0x3C3C4340), width: 1),
    ),

    // This is your “focused” state border
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFF28AF6E), width: 1),
    ),

    // You can still leave `border:` as a fallback if you like:
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0x3C3C4340), width: 1),
    ),

    hintStyle: const TextStyle(color: Color(0x3C3C4340)),
  ),

  cardTheme: CardTheme(
    color: Color(0xFFF5F5F5),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xFF00A86B),
    unselectedItemColor: Colors.grey,
    selectedIconTheme: IconThemeData(size: 28),
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
);
