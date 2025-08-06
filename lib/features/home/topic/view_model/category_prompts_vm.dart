import 'package:ai_chat_bot_project/features/home/topic/models/category_prompt_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryViewModelProvider = ChangeNotifierProvider((ref) => CategoryViewModel());

class CategoryViewModel extends ChangeNotifier {
  final List<CategoryPromptModel> _categories = [
    CategoryPromptModel(title: 'Education'),
    CategoryPromptModel(title: 'Entertainment'),
    CategoryPromptModel(title: 'Idea,Business'),
    CategoryPromptModel(title: 'Music'),
    CategoryPromptModel(title: 'News'),
  ];

  int _selectedIndex = 0;

  List<CategoryPromptModel> get categories => _categories;
  int get selectedIndex => _selectedIndex;

  void selectCategory(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
