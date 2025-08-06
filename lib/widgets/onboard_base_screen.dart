import 'package:ai_chat_bot_project/core/color.dart';
import 'package:ai_chat_bot_project/core/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardBaseScreen extends StatelessWidget {
  final String animationPath;
  final String title1;
  final String title2;

  const OnboardBaseScreen({
    super.key,
    required this.animationPath,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.bgOnboardTwo),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Lottie.asset(
                        animationPath,
                        fit: BoxFit.fill,
                        repeat: true,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -103,
                    top: MediaQuery.of(context).size.height * 0.3,
                    child: _blurCircle(),
                  ),
                  Positioned(
                    right: -103,
                    top: MediaQuery.of(context).size.height * 0.1,
                    child: _blurCircle(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      title2,
                      style: TextStyle(
                        color: AppColors.lightGreen,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _blurCircle() {
    return Container(
      width: 206,
      height: 206,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightGreenBlur.withOpacity(0.08),
      ),
    );
  }
}
