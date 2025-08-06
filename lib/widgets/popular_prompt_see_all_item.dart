import 'package:ai_chat_bot_project/core/app_text_style.dart';
import 'package:ai_chat_bot_project/core/color.dart';
import 'package:ai_chat_bot_project/core/images.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/popular_prompts_model.dart';
import 'package:flutter/material.dart';

class PopularPromptSeeAllItem extends StatefulWidget {
  final PopularPrompt promp;

  const PopularPromptSeeAllItem({super.key, required this.promp});

  @override
  State<PopularPromptSeeAllItem> createState() => _PopularPromptSeeAllItemState();
}

class _PopularPromptSeeAllItemState extends State<PopularPromptSeeAllItem> {
  late bool isSave = false;

  void _toggleSave() {
    setState(() {
      isSave = !isSave;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 114,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.blackGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppImages.icRocket,
                width: 24,
                height: 24,
              ),
              GestureDetector(
                onTap: _toggleSave,
                child: Image.asset(
                  isSave ? AppImages.icSave : AppImages.icUnsave,
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 32,
            child: Text(
              widget.promp.author ?? '',
              style: AppTextStyle.title16Semibold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 28,
            child: Text(
              widget.promp.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.body14Regular,
            ),
          ),
        ],
      ),
    );
  }
}
