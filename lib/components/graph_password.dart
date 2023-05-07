import 'package:flutter/material.dart';
import 'package:gesture_password_widget/gesture_password_widget.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/safe_print.dart';

class GraphPassword extends StatelessWidget {
  const GraphPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GesturePasswordWidget(
      size: 250,
      loose: false,
      answer: [0, 1, 2],
      lineWidth: 0.5,
      lineColor: Palette.blue,
      errorLineColor: Palette.red,
      arrowItem: const SizedBox.shrink(),
      errorArrowItem: const SizedBox.shrink(),
      normalItem: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Palette.purple),
        ),
      ),
      selectedItem: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Palette.blue),
        ),
        child: const CircleAvatar(radius: 5, backgroundColor: Colors.blue),
      ),
      errorItem: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Palette.red),
        ),
        child: const CircleAvatar(radius: 5, backgroundColor: Colors.red),
      ),
      onComplete: (answer) {
        SafePrint.info('answer: $answer');
      },
    );
  }
}
