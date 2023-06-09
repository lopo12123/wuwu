import 'package:flutter/material.dart';

enum IconImage {
  draw('images/icons/draw.png');

  final String src;

  const IconImage(this.src);

  static Image use(IconImage icon, {double? size, Color? color}) {
    return Image.asset(
      icon.src,
      width: size ?? 24,
      height: size ?? 24,
      color: color,
    );
  }
}
