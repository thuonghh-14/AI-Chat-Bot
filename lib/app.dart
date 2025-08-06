import 'package:ai_chat_bot_project/core/theme.dart';
import 'package:ai_chat_bot_project/router/app_router.dart';
import 'package:flutter/material.dart';

class AIChatBotApp extends StatelessWidget {
  const AIChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AIChatBot App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
