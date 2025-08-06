import 'package:ai_chat_bot_project/core/color.dart';
import 'package:ai_chat_bot_project/core/icons.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/character_assistant_model.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/popular_prompts_model_topics.dart';
import 'package:ai_chat_bot_project/features/home/topic/view_model/character_assistant_vm.dart';
import 'package:ai_chat_bot_project/features/home/topic/view_model/popular_prompts_topic_vm.dart';
import 'package:ai_chat_bot_project/widgets/character_card.dart';
import 'package:ai_chat_bot_project/widgets/popular_prompt_topic_item.dart';
import 'package:flutter/material.dart';
import 'package:ai_chat_bot_project/core/app_text_style.dart';
import 'package:ai_chat_bot_project/core/images.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/explore_item_model.dart';
import 'package:ai_chat_bot_project/features/home/topic/view_model/explore_list_vm.dart';
import 'package:ai_chat_bot_project/widgets/main_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class TopicScreen extends StatefulWidget {
  TopicScreen({super.key});

  final ExploreListViewModel exploreListViewModel = ExploreListViewModel();
  final CharacterAssistantViewModel characterAssistantViewModel = CharacterAssistantViewModel();
  final PopularPromptsTopicViewModel popularPromptsTopicViewModel = PopularPromptsTopicViewModel();

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ExploreItem> exploreItemsList = widget.exploreListViewModel.items;
    final List<CharacterAssistant> assistantItemList = widget.characterAssistantViewModel.characters;
    final List<PopularPromptsTopic> popularPromptsTopicItemsList = widget.popularPromptsTopicViewModel.items;

    final previewList = assistantItemList.length > 5 ? assistantItemList.take(5).toList() : assistantItemList;
    final row1 = popularPromptsTopicItemsList.sublist(0, 3);
    final row2 = popularPromptsTopicItemsList.sublist(3, 6);
    return Scaffold(
      appBar: MainAppBar(
        title: 'Topics',
        count: 5,
      ),
      body: Container(
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.bannerAI,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 20),
                Text(
                  'Explore',
                  style: AppTextStyle.title18SemiBold,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exploreItemsList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = exploreItemsList[index];
                      return _buildExploreButton(item);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Assistants',
                      style: AppTextStyle.title18SemiBold,
                    ),
                    SeeAllBtn(
                      onTap: () => context.push('/see_assistant'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 170,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: previewList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final character = previewList[index];
                      return CharacterCard(
                        character: character,
                        onTap: () {},
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Popular Prompts',
                      style: AppTextStyle.title18SemiBold,
                    ),
                    SeeAllBtn(
                      onTap: () => context.push('/see_prompts'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          PopularPromptTopicItem(promp: row1[index]),
                          const SizedBox(height: 16),
                          PopularPromptTopicItem(promp: row2[index]),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExploreButton(ExploreItem item) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: AppColors.transparent,
      ),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                item.imagePath,
                width: 106,
                height: 106,
              ),
              if (item.premiumActive == true)
                Positioned(
                  top: -5,
                  right: -3,
                  child: SvgPicture.asset(
                    AppIcons.icPremium,
                    width: 24,
                    height: 24,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 112,
            height: 50,
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: AppTextStyle.interTitle14Medium,
            ),
          ),
        ],
      ),
    );
  }
}

class SeeAllBtn extends StatelessWidget {
  final VoidCallback onTap;
  const SeeAllBtn({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'See All',
                style: AppTextStyle.body14Regular,
              ),
              SizedBox(width: 4),
              SvgPicture.asset(AppIcons.icSeeAllArrowRight),
            ],
          ),
        ],
      ),
    );
  }
}
