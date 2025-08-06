import 'package:ai_chat_bot_project/core/images.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/popular_prompts_model_topics.dart';

class PopularPromptsTopicViewModel {
  List<PopularPromptsTopic> get items => [
        PopularPromptsTopic(
          author: 'Design a logo',
          title: 'Create a brand logo in custom style',
          icon: AppImages.icRocket,
          isPremium: true,
          isSave: false,
        ),
        PopularPromptsTopic(
          author: 'Business Hub',
          title: 'How to become rich in 1 year',
          icon: AppImages.icMoney,
          isPremium: false,
          isSave: true,
        ),
        PopularPromptsTopic(
          author: 'Pocket Editor',
          title: 'Produce unique rewrites',
          icon: AppImages.icWrite,
          isPremium: false,
          isSave: false,
        ),
        PopularPromptsTopic(
          author: 'Song writer',
          title: 'Generate lyrics and chords',
          icon: AppImages.icGuitar,
          isPremium: false,
          isSave: false,
        ),
        PopularPromptsTopic(
          author: 'Social Media',
          title: 'Write engaging posts and captions',
          icon: AppImages.icSing,
          isPremium: false,
          isSave: false,
        ),
        PopularPromptsTopic(
          author: 'Translate',
          title: 'Create content in any language',
          icon: AppImages.icEarth,
          isPremium: false,
          isSave: false,
        ),
      ];
}
