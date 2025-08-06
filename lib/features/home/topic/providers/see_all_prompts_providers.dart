import 'package:ai_chat_bot_project/features/home/topic/models/popular_prompts_model.dart';
import 'package:ai_chat_bot_project/features/home/topic/view_model/popular_prompts_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final popularPromptsProvider = StateNotifierProvider<PopularPromptsViewModel, AsyncValue<List<PopularPrompt>>>(
  (ref) => PopularPromptsViewModel(ref.read(apiServiceProvider)),
);
