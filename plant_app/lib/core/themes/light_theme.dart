import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Roboto',
  primaryColor: Color(0xFF00A86B), // Plant green
  colorScheme: ColorScheme.light(
    primary: Color(0xFF00A86B), // Green buttons
    secondary: Color(0xFFEEEEEE), // Light gray for backgrounds/cards
    onPrimary: Colors.white, // Text on green button
    onSecondary: Colors.black, // Text on secondary bg
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
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
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
    fillColor: Color(0xFFF5F5F5),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.grey),
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
