import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors.dart';

final themeData = ThemeData(
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: green,
      fontSize: 48,
      fontWeight: FontWeight.w900,
    ),
    titleMedium: TextStyle(
      color: green,
      fontSize: 28,
      fontWeight: FontWeight.w900,
    ),
    titleSmall: TextStyle(
      color: green,
      fontSize: 18,
      fontWeight: FontWeight.w800,
    ),
    headlineLarge: TextStyle(
      color: darkGrey,
      fontSize: 48,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: TextStyle(
      color: darkGrey,
      fontSize: 28,
      fontWeight: FontWeight.w900,
    ),
    headlineSmall: TextStyle(
      color: darkGrey,
      fontSize: 18,
      fontWeight: FontWeight.w800,
    ),
    bodyMedium: TextStyle(
      color: mediumGrey,
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      color: mediumGrey,
      fontSize: 14,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: green),
  useMaterial3: true,
);
