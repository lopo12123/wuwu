import 'package:flutter/material.dart';
import 'package:wuwu/styles/palette.dart';

abstract class MyButtonStyle {
  /// 取消按钮
  static final cancel = ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(32),
    backgroundColor: Palette.b00,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Palette.b70),
      borderRadius: BorderRadius.circular(16),
    ),
  );
  /// 确认按钮
  static final confirm = ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(32),
    backgroundColor: Palette.b90,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

// static final CreateTag = TextButton.styleFrom(
//   fixedSize: const Size.fromHeight(40),
//   padding: const EdgeInsets.symmetric(horizontal: 16),
//   shape: RoundedRectangleBorder(
//     side: const BorderSide(color: Palette.b70),
//     borderRadius: BorderRadius.circular(20),
//   ),
//   alignment: Alignment.center,
//   foregroundColor: Palette.b00,
//   backgroundColor: Palette.b00,
//   splashFactory: NoSplash.splashFactory,
// );
}
