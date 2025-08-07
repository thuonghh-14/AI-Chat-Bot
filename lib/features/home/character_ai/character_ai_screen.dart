import 'package:ai_chat_bot_project/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class CharacterAiScreen extends StatelessWidget {
  const CharacterAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Character AI',
        count: 5,
      ),
    );
  }
}
