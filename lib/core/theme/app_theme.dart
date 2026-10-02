import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
static ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
  ),

  scaffoldBackgroundColor: AppColors.lightBackground,


textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    bodyLarge: TextStyle(
      fontSize: 16,
    ),

    bodyMedium: TextStyle(
      fontSize: 14,
    ),
  ),
  
);

static ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.dark,
  ),

  scaffoldBackgroundColor: AppColors.darkBackground,

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    bodyLarge: TextStyle(
      fontSize: 16,
    ),

    bodyMedium: TextStyle(
      fontSize: 14,
    ),
  ),
  
);




}
