import 'package:ai_chat_bot_project/core/images.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/explore_item_model.dart';

class ExploreListViewModel {
  List<ExploreItem> get items => [
        ExploreItem(
          title: 'Ai Image generation',
          imagePath: AppImages.exploreAIGeneration,
          premiumActive: false,
        ),
        ExploreItem(
          title: 'PDF & URL summarizers',
          imagePath: AppImages.explorePDF,
          premiumActive: true,
        ),
        ExploreItem(
          title: 'AI Scan',
          imagePath: AppImages.exploreAIScan,
          premiumActive: false,
        ),
      ];
}
