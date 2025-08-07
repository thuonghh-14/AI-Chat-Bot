import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_chat_bot_project/core/app_text_style.dart';
import 'package:ai_chat_bot_project/core/color.dart';
import 'package:ai_chat_bot_project/core/images.dart';
import 'package:ai_chat_bot_project/features/home/summarizers/view_model/summarizer_pdf_vm.dart';

final summarizerPDFProvider = StateNotifierProvider<SummarizerPDFViewModel, SummarizerPDFState>(
  (ref) => SummarizerPDFViewModel(),
);

class SummarizerPDFScreen extends ConsumerWidget {
  const SummarizerPDFScreen({super.key});

  Future<void> _pickPdf(BuildContext context, WidgetRef ref) async {
    // Giả lập đường dẫn PDF để test
    const fakePdfPath = '/storage/emulated/0/Download/sample_test_file.pdf';
    ref.read(summarizerPDFProvider.notifier).pickPdf(fakePdfPath);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(summarizerPDFProvider);
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
              height: 133,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.blackGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Summarize PDF',
                    style: AppTextStyle.title16Semibold,
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.disableButton,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            state.pdfPath != null ? state.pdfPath!.split('/').last : 'Add PDF File',
                            style: AppTextStyle.title16Medium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        InkWell(
                          onTap: () => _pickPdf(context, ref),
                          child: Image.asset(
                            AppImages.icAdd,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    state.isValid ? 'PDF file selected' : 'Choose a PDF file to summarize',
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
                    SnackBar(content: Text('Summarizing "${state.pdfPath!.split('/').last}"...')),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: state.isValid ? AppColors.lightGreen : AppColors.disableButton,
            foregroundColor: AppColors.white,
            disabledForegroundColor: AppColors.white.withOpacity(0.38),
            disabledBackgroundColor: AppColors.disableButton,
          ),
          child: Text(
            'Summarize PDF',
            style:
                AppTextStyle.title18SemiBold.copyWith(color: state.isValid ? AppColors.black : AppColors.disableText),
          ),
        ),
      ),
    );
  }
}
