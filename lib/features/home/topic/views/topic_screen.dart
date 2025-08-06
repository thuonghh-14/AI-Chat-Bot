import 'package:ai_chat_bot_project/core/color.dart';
import 'package:ai_chat_bot_project/core/icons.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/character_assistant.dart';
import 'package:ai_chat_bot_project/features/home/topic/view_model/character_assistant_vm.dart';
import 'package:ai_chat_bot_project/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:ai_chat_bot_project/core/app_text_style.dart';
import 'package:ai_chat_bot_project/core/images.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/explore_item.dart';
import 'package:ai_chat_bot_project/features/home/topic/view_model/explore_list_vm.dart';
import 'package:ai_chat_bot_project/widgets/main_app_bar.dart';
import 'package:flutter_svg/svg.dart';

class TopicScreen extends StatefulWidget {
  TopicScreen({super.key});

  final ExploreListViewModel exploreListViewModel = ExploreListViewModel();
  final CharacterAssistantViewModel characterAssistantViewModel = CharacterAssistantViewModel();

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ExploreItem> exploreItemsList = widget.exploreListViewModel.items;
    final List<CharacterAssistant> assistantItemList = widget.characterAssistantViewModel.characters;
    final previewList = assistantItemList.length > 5 ? assistantItemList.take(5).toList() : assistantItemList;
    return Scaffold(
      appBar: MainAppBar(
        title: 'Topics',
        count: 5,
      ),
      body: Container(
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.all(12),
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
                  SeeAllBtn(),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: previewList.length,
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
            ],
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
  const SeeAllBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
