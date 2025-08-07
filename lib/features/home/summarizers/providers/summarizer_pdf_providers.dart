import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_model/summarizer_pdf_vm.dart';

final summarizerPDFProvider = StateNotifierProvider<SummarizerPDFViewModel, SummarizerPDFState>(
  (ref) => SummarizerPDFViewModel(),
);
