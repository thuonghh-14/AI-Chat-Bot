import 'package:ai_chat_bot_project/features/home/topic/models/popular_prompts_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _apiKey = '34308624ed3f413c923687061f06116e';

  Future<List<PopularPrompt>> fetchPopularPrompts() async {
    final response = await _dio.get(
      'https://newsapi.org/v2/everything',
      queryParameters: {
        'q': 'bitcoin',
        'apiKey': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List articles = response.data['articles'];
      return articles.map((json) => PopularPrompt.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load prompts');
    }
  }
}
