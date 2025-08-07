import 'package:ai_chat_bot_project/core/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: AppBarTheme(
        color: AppColors.black,
      ),
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
