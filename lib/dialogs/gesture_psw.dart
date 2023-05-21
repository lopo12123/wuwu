import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/graph_password.dart';
import 'package:wuwu/styles/palette.dart';

class GesturePswDialog extends StatelessWidget {
  final String title;

  const GesturePswDialog({super.key, required this.title});

  static Future<List<int>?> show(String title) =>
      Get.dialog(GesturePswDialog(title: title));

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration.zero,
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Palette.transparent,
      child: UnconstrainedBox(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Palette.b00, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              StyledText.XiaoBai(title, fontSize: 22),
              const SizedBox(height: 16),
              GraphPassword(onComplete: (answer) => Get.back(result: answer)),
            ],
          ),
        ),
      ),
    );
  }
}
