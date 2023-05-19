import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/clickable.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/styles/palette.dart';

class SettingItem extends StatelessWidget {
  final Widget? icon;
  final String text;
  final Widget? suffix;
  final VoidCallback? onPressed;

  const SettingItem({
    super.key,
    this.icon,
    required this.text,
    this.suffix,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var c = Container(
      height: 56,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Palette.b00,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          if (icon != null) icon!.paddingOnly(right: 8),
          Expanded(
            child: StyledText.ShouShu(
              text,
              color: Palette.b90,
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (suffix != null) suffix!.paddingOnly(left: 8),
        ],
      ),
    );

    return onPressed == null ? c : Clickable.custom(c, onClick: onPressed!);
  }
}
