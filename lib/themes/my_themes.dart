import 'package:flutter/material.dart';
import 'package:poo_flutter/themes/theme_colors.dart';

ThemeData myTheme = ThemeData(
  primarySwatch: ThemeColors.primaryColor,
  primaryColor: ThemeColors.primaryColor,
  textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 18),
      bodyLarge: TextStyle(fontSize: 20),
  ),
);
