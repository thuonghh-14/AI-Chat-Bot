import 'package:ai_chat_bot_project/features/home/summarizers/view_model/summarizer_web_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final summarizerWebProvider = StateNotifierProvider<SummarizerWebViewModel, SummarizerWebState>(
  (ref) => SummarizerWebViewModel(),
);
