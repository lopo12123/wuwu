import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/styles/palette.dart';

abstract class MyToast {
  static _text(Widget icon, String text, Color color) {
    BotToast.showCustomText(
        toastBuilder: (ctx) {
          return Container(
            height: 34,
            constraints: const BoxConstraints(maxWidth: 250),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ElevatedButton.icon(
              onPressed: null,
              icon: icon,
              label: StyledText.ShouShu(
                text,
                fontSize: 16,
                color: Palette.b10,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
        onlyOne: true);
  }

  static success(String text) {
    _text(
      const Icon(
        Icons.check_circle,
        size: 16,
        color: Palette.b10,
      ),
      text,
      Palette.green,
    );
  }

  static warn(String text) {
    _text(
      const Icon(
        Icons.error,
        size: 16,
        color: Palette.b10,
      ),
      text,
      Palette.yellow,
    );
  }

  static error(String text) {
    _text(
      const Icon(
        Icons.cancel,
        size: 16,
        color: Palette.b10,
      ),
      text,
      Palette.red,
    );
  }
}
