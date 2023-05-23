import 'package:flutter/material.dart';
import 'package:wuwu/styles/palette.dart';

abstract class MyButtonStyle {
  /// 取消按钮
  static final toCreate = ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(40),
    backgroundColor: Palette.b00,
    disabledBackgroundColor: Palette.b00,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Palette.b30),
      borderRadius: BorderRadius.circular(16),
    ),
  );

  /// 取消按钮
  static final cancel = ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(40),
    backgroundColor: Palette.b00,
    disabledBackgroundColor: Palette.b00,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Palette.b70),
      borderRadius: BorderRadius.circular(16),
    ),
  );

  /// 确认按钮
  static final confirm = ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(40),
    backgroundColor: Palette.b90,
    disabledBackgroundColor: Palette.b90,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  /// 底部弹出选择器按钮样式
  static final picker = TextButton.styleFrom(
    fixedSize: const Size.fromHeight(40),
    foregroundColor: Palette.b90,
    disabledForegroundColor: Palette.b50,
    backgroundColor: Palette.b00,
    disabledBackgroundColor: Palette.b00,
    shape: const RoundedRectangleBorder(),
  );

  /// 标签 -- 选中
  static final tagActive = ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(30),
    elevation: 0,
    backgroundColor: Palette.b90,
    disabledBackgroundColor: Palette.b90,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );

  /// 标签 -- 未选中
  static final tagInactive = ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(30),
    elevation: 0,
    backgroundColor: Palette.b00,
    disabledBackgroundColor: Palette.b00,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Palette.b30),
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
