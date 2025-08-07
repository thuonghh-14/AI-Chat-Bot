import 'package:ai_chat_bot_project/core/app_text_style.dart';
import 'package:ai_chat_bot_project/core/color.dart';
import 'package:ai_chat_bot_project/core/images.dart';
import 'package:flutter/material.dart';

class SummarizerButton extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String title;
  final bool isPremium;

  const SummarizerButton({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.title,
    this.isPremium = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.blackGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(imagePath),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: AppTextStyle.body14Medium,
                ),
              ],
            ),
            if (isPremium) Image.asset(AppImages.icPremiumSum),
          ],
        ),
      ),
    );
  }
}
