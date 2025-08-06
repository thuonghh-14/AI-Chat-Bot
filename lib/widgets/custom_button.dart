import 'package:ai_chat_bot_project/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final String? icon;
  final double height;
  final double widght;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isDisabled = false,
    this.icon,
    this.height = 48,
    this.widght = double.infinity,
    this.borderRadius = 12,
    this.textStyle,
    this.backgroundColor = AppColors.lightGreen,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDisabled ? AppColors.disableButton : backgroundColor;
    final textColor = isDisabled ? AppColors.disableText : AppColors.black;

    return Opacity(
      opacity: isDisabled ? 0.8 : 1,
      child: GestureDetector(
        onTap: isDisabled ? null : onPressed,
        child: Container(
          height: height,
          width: widght,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: textStyle ??
                    TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(width: 4),
              if (icon?.trim().isNotEmpty == true) ...[
                SvgPicture.asset(icon!),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
