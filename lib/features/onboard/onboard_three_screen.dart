import 'package:ai_chat_bot_project/core/app_anim.dart';
import 'package:ai_chat_bot_project/widgets/onboard_base_screen.dart';
import 'package:flutter/material.dart';

class OnboardThreeScreen extends StatelessWidget {
  const OnboardThreeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return OnboardBaseScreen(
      animationPath: AppAnim.animationOnboardThree,
      title1: 'All-in-one',
      title2: 'AI Tools',
    );
  }
}
