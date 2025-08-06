import 'package:ai_chat_bot_project/features/home/home_bottom_screen.dart';
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
  ],
);
