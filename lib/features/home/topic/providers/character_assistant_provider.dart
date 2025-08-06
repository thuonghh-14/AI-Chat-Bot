import 'package:ai_chat_bot_project/features/home/topic/view_model/character_assistant_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterAssistantProvider = ChangeNotifierProvider<CharacterAssistantViewModel>((ref) {
  return CharacterAssistantViewModel();
});
