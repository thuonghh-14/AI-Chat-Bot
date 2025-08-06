import 'package:ai_chat_bot_project/core/app_anim.dart';
import 'package:ai_chat_bot_project/widgets/onboard_base_screen.dart';
import 'package:flutter/material.dart';

class OnboardTwoScreen extends StatelessWidget {
  const OnboardTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardBaseScreen(
      animationPath: AppAnim.animationOnboardTwo,
      title1: 'Get help with multiple',
      title2: 'AI possibilities',
    );
  }
}
