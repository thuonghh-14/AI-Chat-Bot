import 'package:ai_chat_bot_project/features/home/home_bottom_screen.dart';
import 'package:ai_chat_bot_project/features/home/summarizers/views/summarizer_pdf_screen.dart';
import 'package:ai_chat_bot_project/features/home/summarizers/views/summarizer_web_screen.dart';
import 'package:ai_chat_bot_project/features/home/topic/views/see_all_assistant_screen.dart';
import 'package:ai_chat_bot_project/features/home/topic/views/see_all_prompts_screen.dart';
import 'package:go_router/go_router.dart';
import '../features/onboard/onboarding_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeBottomScreen(),
    ),
    GoRoute(
      path: '/see_assistant',
      builder: (context, state) => const SeeAllAssistantScreen(),
    ),
    GoRoute(
      path: '/see_prompts',
      builder: (context, state) => const SeeAllPromptsScreen(),
    ),
    GoRoute(
      path: '/summarizers_pdf',
      builder: (context, state) => const SummarizerPDFScreen(),
    ),
    GoRoute(
      path: '/summarizers_web',
      builder: (context, state) => const SummarizerWebScreen(),
    ),
  ],
);
