import 'package:flutter/material.dart';
 
 // ekran yapısındaki light theme
final lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Color.fromARGB(255, 228, 234, 241), // Light theme background
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 246, 226, 13),
    foregroundColor: Colors.black,
  ),
  cardColor: Color.fromARGB(255, 248, 249, 250), // Light theme block background
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black), // Light theme text color
    bodyMedium: TextStyle(color: Colors.black),
  ),
  iconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.grey[300],
);

// ekran yapısındaki dark theme
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Color.fromARGB(255, 71, 71, 71), // Dark theme background
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 106, 13, 246),
    foregroundColor: Colors.white,
  ),
  cardColor: Color.fromARGB(255, 51, 51, 51), // Dark theme block background
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // Dark theme text color
    bodyMedium: TextStyle(color: Colors.white),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.grey[600],
);
