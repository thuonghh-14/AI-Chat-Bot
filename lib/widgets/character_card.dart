import 'package:ai_chat_bot_project/core/icons.dart';
import 'package:ai_chat_bot_project/core/images.dart';
import 'package:ai_chat_bot_project/features/home/topic/models/character_assistant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CharacterCard extends StatelessWidget {
  final CharacterAssistant character;
  final VoidCallback? onTap;

  const CharacterCard({
    super.key,
    required this.character,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String? localBg = AppImages.characterBg[character.id];
    final bool useAsset = (character.bgImageUrl.isEmpty || localBg != null);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: useAsset
                ? AssetImage(localBg ?? AppImages.characterBg[1]!) as ImageProvider
                : NetworkImage(character.bgImageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            if (character.premiumActive == true)
              Positioned(
                top: -5,
                right: -3,
                child: SvgPicture.asset(
                  AppIcons.icPremium,
                  width: 24,
                  height: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
