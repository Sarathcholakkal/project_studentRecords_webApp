import 'package:flutter/material.dart';

final lightMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF1DB954), // Spotify green
    brightness: Brightness.light,
  ).copyWith(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white, // Primary color
    foregroundColor: Colors.black, // Text/icon color
  ),
);

// Define the dark theme
final darkMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF1DB954), // Spotify green
    brightness: Brightness.dark,
  ).copyWith(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black, // Primary color
    foregroundColor: Colors.white, // Text/icon color
  ),
);
