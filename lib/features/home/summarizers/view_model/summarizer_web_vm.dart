import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummarizerWebState {
  final String link;
  final bool isValid;

  SummarizerWebState({
    this.link = '',
    this.isValid = false,
  });

  SummarizerWebState copyWith({
    String? link,
    bool? isValid,
  }) {
    return SummarizerWebState(
      link: link ?? this.link,
      isValid: isValid ?? this.isValid,
    );
  }
}

class SummarizerWebViewModel extends StateNotifier<SummarizerWebState> {
  SummarizerWebViewModel() : super(SummarizerWebState());

  void updateLink(String link) {
    final isValid = _isValidUrl(link);
    state = state.copyWith(link: link, isValid: isValid);
  }

  bool _isValidUrl(String input) {
    final uri = Uri.tryParse(input);
    return uri != null && uri.hasAbsolutePath && (uri.isScheme('http') || uri.isScheme('https'));
  }
}
