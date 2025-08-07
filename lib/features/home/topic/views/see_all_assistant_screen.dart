import 'package:ai_chat_bot_project/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_chat_bot_project/features/home/topic/providers/character_assistant_provider.dart';
import 'package:ai_chat_bot_project/core/app_text_style.dart';
import 'package:ai_chat_bot_project/core/color.dart';
import 'package:go_router/go_router.dart';

class SeeAllAssistantScreen extends ConsumerStatefulWidget {
  const SeeAllAssistantScreen({super.key});

  @override
  ConsumerState<SeeAllAssistantScreen> createState() => _SeeAllAssistantScreenState();
}

class _SeeAllAssistantScreenState extends ConsumerState<SeeAllAssistantScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    final viewModel = ref.read(characterAssistantProvider);
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      viewModel.loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(characterAssistantProvider);
    final characters = viewModel.visibleCharacters;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Assistants',
          style: AppTextStyle.title18Medium,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          controller: _scrollController,
          itemCount: characters.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return CharacterCard(
              character: characters[index],
              onTap: () {
                debugPrint('Tapped ${characters[index].name}');
              },
            );
          },
        ),
      ),
    );
  }
}
