import 'package:ai_chat_bot_project/core/color.dart';
import 'package:ai_chat_bot_project/core/icons.dart';
import 'package:ai_chat_bot_project/core/images.dart';
import 'package:ai_chat_bot_project/features/home/ai_art/ai_art_screen.dart';
import 'package:ai_chat_bot_project/features/home/character_ai/character_ai_screen.dart';
import 'package:ai_chat_bot_project/features/home/topic/views/topic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeBottomScreen extends StatefulWidget {
  const HomeBottomScreen({super.key});

  @override
  _HomeBottomScreenState createState() => _HomeBottomScreenState();
}

class _HomeBottomScreenState extends State<HomeBottomScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    TopicScreen(),
    AIArtScreen(),
    CharacterAiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        color: AppColors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.blackGrey,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.icPDF,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(
                        AppImages.icScan,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Ask another question',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Image.asset(
                        AppImages.icMic,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.black,
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.transparent,
              unselectedItemColor: AppColors.transparent,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.icTopicsOff,
                    width: 96,
                    height: 46,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppIcons.icTopicsOn,
                    width: 96,
                    height: 46,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.icAIArtOff,
                    width: 96,
                    height: 46,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppIcons.icAIArtOn,
                    width: 96,
                    height: 46,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.icCharacterAIOff,
                    width: 96,
                    height: 46,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppIcons.icCharacterAIOn,
                    width: 96,
                    height: 46,
                  ),
                  label: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
