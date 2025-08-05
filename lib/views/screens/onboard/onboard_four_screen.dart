import 'package:ai_chat_bot_project/core/app_anim.dart';
import 'package:ai_chat_bot_project/views/widgets/onboard_base_screen.dart';
import 'package:flutter/material.dart';

class OnboardFourScreen extends StatelessWidget {
  const OnboardFourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardBaseScreen(
      animationPath: AppAnim.animationOnboardFour,
      title1: 'Join our 100M+',
      title2: 'Happy Users',
    );
  }
}
