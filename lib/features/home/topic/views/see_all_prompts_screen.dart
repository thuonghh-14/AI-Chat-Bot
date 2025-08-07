import 'package:ai_chat_bot_project/core/app_text_style.dart';
import 'package:ai_chat_bot_project/core/color.dart';
import 'package:ai_chat_bot_project/features/home/topic/providers/see_all_prompts_providers.dart';
import 'package:ai_chat_bot_project/features/home/topic/view_model/category_prompts_vm.dart';
import 'package:ai_chat_bot_project/widgets/popular_prompt_see_all_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SeeAllPromptsScreen extends ConsumerStatefulWidget {
  const SeeAllPromptsScreen({super.key});

  @override
  ConsumerState<SeeAllPromptsScreen> createState() => _SeeAllPromptsState();
}

class _SeeAllPromptsState extends ConsumerState<SeeAllPromptsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    final viewModel = ref.read(popularPromptsProvider.notifier);

    Future.microtask(() {
      if (ref.read(popularPromptsProvider) is! AsyncData) {
        viewModel.fetchPrompts();
      }
    });
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    final viewModel = ref.read(popularPromptsProvider.notifier);
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        viewModel.hasMore) {
      setState(() {
        _isLoadingMore = true;
      });
      await viewModel.loadMore();
      if (mounted) {
        setState(() {
          _isLoadingMore = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryViewModel = ref.watch(categoryViewModelProvider);
    final categories = categoryViewModel.categories;
    final selectedIndex = categoryViewModel.selectedIndex;

    final promptsAsync = ref.watch(popularPromptsProvider);
    final viewModel = ref.read(popularPromptsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.pop()),
        title: Text(
          'Assistants',
          style: AppTextStyle.title18Medium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 29,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  final category = categories[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        ref.read(categoryViewModelProvider).selectCategory(index);
                        ref.read(popularPromptsProvider.notifier).fetchPrompts();
                      },
                      child: Container(
                        width: 120,
                        height: 29,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.lightGreen : AppColors.blackGrey,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          category.title,
                          style: isSelected
                              ? AppTextStyle.body14Medium.copyWith(color: AppColors.black)
                              : AppTextStyle.body14Regular.copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: promptsAsync.when(
                data: (prompts) {
                  return Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          controller: _scrollController,
                          itemCount: prompts.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 136 / 101,
                          ),
                          itemBuilder: (context, index) {
                            return PopularPromptSeeAllItem(promp: prompts[index]);
                          },
                        ),
                      ),
                      if (_isLoadingMore && viewModel.hasMore)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(
                  child: Text(
                    'Failed to load prompts\n$e',
                    style: AppTextStyle.body14Regular.copyWith(color: AppColors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
