import 'package:ai_chat_bot_project/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class AIArtScreen extends StatelessWidget {
  const AIArtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'AI Art',
        count: 5,
      ),
    );
  }
}
