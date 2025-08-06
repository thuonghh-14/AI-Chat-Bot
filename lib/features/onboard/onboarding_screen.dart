import 'dart:async';
import 'package:ai_chat_bot_project/core/icons.dart';
import 'package:ai_chat_bot_project/features/onboard/onboard_four_screen.dart';
import 'package:ai_chat_bot_project/features/onboard/onboard_three_screen.dart';
import 'package:ai_chat_bot_project/features/onboard/onboard_two_screen.dart';
import 'package:ai_chat_bot_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  late Timer _timer;

  final List<Widget> _pages = [
    OnboardTwoScreen(),
    OnboardThreeScreen(),
    OnboardFourScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 7), (timer) {
      int nextPage = _currentIndex + 1;
      if (nextPage >= _pages.length) {
        nextPage = 0;
      }
      _controller.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomButton(
                      height: 72,
                      borderRadius: 16,
                      title: 'Continue',
                      icon: AppIcons.icArrowRight,
                      onPressed: () {
                        context.go('/home');
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: _pages.length,
                    effect: WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: Colors.white,
                      dotColor: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
