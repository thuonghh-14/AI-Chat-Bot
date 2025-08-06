import 'package:ai_chat_bot_project/features/home/topic/models/popular_prompts_model.dart';
import 'package:ai_chat_bot_project/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularPromptsViewModel extends StateNotifier<AsyncValue<List<PopularPrompt>>> {
  final ApiService _apiService;

  List<PopularPrompt> _allData = [];
  int _currentIndex = 0;
  final int _pageSize = 16;
  bool _hasMore = true;
  bool _isLoading = false;

  PopularPromptsViewModel(this._apiService) : super(const AsyncLoading()) {
    fetchPrompts();
  }

  Future<void> fetchPrompts() async {
    try {
      _currentIndex = 0;
      _hasMore = true;
      state = const AsyncLoading();
      _allData = await _apiService.fetchPopularPrompts();

      final firstPage = _allData.take(_pageSize).toList();
      _currentIndex = firstPage.length;
      _hasMore = _currentIndex < _allData.length;

      state = AsyncValue.data(firstPage);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loadMore() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    try {
      final current = state.value ?? [];

      // Simulate loading delay
      await Future.delayed(const Duration(milliseconds: 500));

      final nextItems = _allData.skip(_currentIndex).take(_pageSize).toList();
      _currentIndex += nextItems.length;
      _hasMore = _currentIndex < _allData.length;

      state = AsyncValue.data([...current, ...nextItems]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isLoading = false;
    }
  }

  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;
}
