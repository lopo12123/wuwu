import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/styles/button.dart';
import 'package:wuwu/styles/palette.dart';

Widget bsBase({
  required String title,
  required List<Widget> children,
  bool operators = true,
  VoidCallback? onCancel,
  VoidCallback? onConfirm,
}) {
  return SafeArea(
    top: false,
    child: Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: Palette.b00,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StyledText.XiaoBai(title, fontSize: 22).paddingSymmetric(vertical: 8),
          const Divider(height: 1, thickness: 1, color: Palette.b30),
          ...children,
          if (operators)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: MyButtonStyle.cancel,
                      onPressed: onCancel,
                      child: const StyledText.XiaoBai(
                        '取消',
                        color: Palette.b90,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: MyButtonStyle.confirm,
                      onPressed: onConfirm,
                      child: const StyledText.XiaoBai(
                        '确认',
                        color: Palette.b00,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    ),
  );
}
