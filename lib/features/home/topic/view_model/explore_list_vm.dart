import 'package:ai_chat_bot_project/core/images.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/explore_item_model.dart';

class ExploreListViewModel {
  List<ExploreItem> get items => [
        ExploreItem(
          id: 1,
          title: 'Ai Image generation',
          imagePath: AppImages.exploreAIGeneration,
          premiumActive: false,
        ),
        ExploreItem(
          id: 2,
          title: 'PDF & URL summarizers',
          imagePath: AppImages.explorePDF,
          premiumActive: true,
        ),
        ExploreItem(
          id: 3,
          title: 'AI Scan',
          imagePath: AppImages.exploreAIScan,
          premiumActive: false,
        ),
      ];
}
