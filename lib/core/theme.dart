import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'SFProText',
          fontWeight: FontWeight.w600,
          fontSize: 14,
          height: 1.0,
          letterSpacing: 0,
        ),
      ),
    );
  }
}
