import 'package:flutter/material.dart';
import 'package:gesture_password_widget/gesture_password_widget.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/safe_print.dart';

class GraphPassword extends StatelessWidget {
  final double size;

  final void Function(List<int> answer) onComplete;

  const GraphPassword({super.key, required this.onComplete, this.size = 250});

  @override
  Widget build(BuildContext context) {
    return GesturePasswordWidget(
      size: size,
      loose: false,
      lineWidth: 0.5,
      lineColor: Palette.b90,
      errorLineColor: Palette.red,
      arrowItem: const SizedBox.shrink(),
      errorArrowItem: const SizedBox.shrink(),
      normalItem: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Palette.b90),
        ),
      ),
      selectedItem: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Palette.purple),
        ),
        child: const CircleAvatar(radius: 5, backgroundColor: Palette.purple),
      ),
      errorItem: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Palette.red),
        ),
        child: const CircleAvatar(radius: 5, backgroundColor: Palette.red),
      ),
      onComplete: (answer) => onComplete(List<int>.from(answer)),
    );
  }
}
