import 'package:ai_chat_bot_project/core/app_text_style.dart';
import 'package:ai_chat_bot_project/core/color.dart';
import 'package:ai_chat_bot_project/core/icons.dart';
import 'package:ai_chat_bot_project/core/images.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/popular_prompts_model_topics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopularPromptTopicItem extends StatefulWidget {
  final PopularPromptsTopic promp;

  const PopularPromptTopicItem({super.key, required this.promp});

  @override
  State<PopularPromptTopicItem> createState() => _PopularPromptTopicItemState();
}

class _PopularPromptTopicItemState extends State<PopularPromptTopicItem> {
  late bool isSave = false;

  @override
  void initState() {
    super.initState();
    isSave = widget.promp.isSave;
  }

  void _toggleSave() {
    setState(() {
      isSave = !isSave;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      height: 101,
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
                widget.promp.icon,
                width: 24,
                height: 24,
              ),
              widget.promp.isPremium == true
                  ? SvgPicture.asset(
                      AppIcons.icPremium,
                      width: 24,
                      height: 24,
                    )
                  : GestureDetector(
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
          Text(
            widget.promp.author,
            style: AppTextStyle.body14Semibold,
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 24,
            child: Text(
              widget.promp.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.body10Regular,
            ),
          ),
        ],
      ),
    );
  }
}
