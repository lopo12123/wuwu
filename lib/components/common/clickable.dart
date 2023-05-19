import 'package:flutter/material.dart';

/// 添加了点击事件的组件
abstract class Clickable {
  /// Custom
  static Widget custom(Widget child, {required void Function() onClick}) {
    return GestureDetector(onTap: onClick, child: child);
  }

  /// Icon -- Icon (无默认边距)
  static Widget icon(
    IconData icon, {
    Color? color,
    double? size,
    required void Function() onClick,
  }) {
    return GestureDetector(
      onTap: onClick,
      child: Icon(icon, color: color, size: size),
    );
  }

  /// Icon
  static Widget image(Image image, void Function() onClick) {
    return GestureDetector(onTap: onClick, child: image);
  }
}
