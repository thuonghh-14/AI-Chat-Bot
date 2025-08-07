import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummarizerPDFState {
  final String? pdfPath;
  final bool isValid;

  SummarizerPDFState({
    this.pdfPath,
    this.isValid = false,
  });

  SummarizerPDFState copyWith({
    String? pdfPath,
    bool? isValid,
  }) {
    return SummarizerPDFState(
      pdfPath: pdfPath ?? this.pdfPath,
      isValid: isValid ?? this.isValid,
    );
  }
}

class SummarizerPDFViewModel extends StateNotifier<SummarizerPDFState> {
  SummarizerPDFViewModel() : super(SummarizerPDFState());

  void pickPdf(String path) {
    state = state.copyWith(pdfPath: path, isValid: true);
  }
}
