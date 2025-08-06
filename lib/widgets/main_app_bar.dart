import 'package:ai_chat_bot_project/core/app_text_style.dart';
import 'package:ai_chat_bot_project/core/color.dart';
import 'package:ai_chat_bot_project/core/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int count;

  const MainAppBar({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.black,
      elevation: 2,
      title: Text(
        title,
        style: AppTextStyle.title20Bold,
      ),
      leading: IconButton(
        onPressed: () {
          if (Scaffold.of(context).hasDrawer) {
            Scaffold.of(context).openDrawer();
          }
        },
        icon: SvgPicture.asset(
          AppIcons.icSetting,
          width: 24,
          height: 24,
        ),
      ),
      actions: [
        Container(
          width: 48,
          height: 23,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.disableButton,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                AppIcons.icPremium,
                width: 20,
                height: 20,
              ),
              SizedBox(width: 4),
              Text('$count', style: AppTextStyle.body14Medium),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
