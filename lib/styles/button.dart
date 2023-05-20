import 'package:flutter/material.dart';
import 'package:wuwu/styles/palette.dart';

abstract class MyButtonStyle {
  /// 取消按钮
  static final cancel = ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(48),
    backgroundColor: Palette.b00,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Palette.b70),
      borderRadius: BorderRadius.circular(16),
    ),
  );

  /// 确认按钮
  static final confirm = ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(48),
    backgroundColor: Palette.b90,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );
}
