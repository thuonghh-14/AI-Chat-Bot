import 'package:ai_chat_bot_project/features/home/summarizers/providers/summarizer_web_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_chat_bot_project/core/app_text_style.dart';
import 'package:ai_chat_bot_project/core/color.dart';

class SummarizerWebScreen extends ConsumerWidget {
  const SummarizerWebScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(summarizerWebProvider);
    final viewModel = ref.read(summarizerWebProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Summarizers',
          style: AppTextStyle.title18Medium,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.blackGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Summarize Web',
                    style: AppTextStyle.title16Semibold,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    onChanged: viewModel.updateLink,
                    controller: TextEditingController(text: state.link)
                      ..selection = TextSelection.fromPosition(
                        TextPosition(offset: state.link.length),
                      ),
                    style: AppTextStyle.title16Medium,
                    decoration: InputDecoration(
                      hintText: 'Enter link here',
                      hintStyle: AppTextStyle.title16Medium.copyWith(color: AppColors.disableText),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      filled: true,
                      fillColor: AppColors.disableButton,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.isValid ? 'Valid link detected' : 'Enter a valid URL to summarize',
                    style: AppTextStyle.body12Regular,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: state.isValid
              ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Summarizing "${state.link}"...')),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: state.isValid ? AppColors.lightGreen : AppColors.disableButton,
            foregroundColor: AppColors.white,
            disabledForegroundColor: AppColors.white.withOpacity(0.38),
            disabledBackgroundColor: AppColors.disableButton,
          ),
          child: Text(
            'Summarize Web',
            style: AppTextStyle.title18SemiBold.copyWith(
              color: state.isValid ? AppColors.black : AppColors.disableText,
            ),
          ),
        ),
      ),
    );
  }
}
