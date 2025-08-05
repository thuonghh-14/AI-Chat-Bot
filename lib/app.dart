import 'package:ai_chat_bot_project/core/theme.dart';
import 'package:ai_chat_bot_project/views/screens/onboard/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AIChatBotApp extends StatelessWidget {
  const AIChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIChatBot App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
