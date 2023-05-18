import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/input_box.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/styles/button.dart';
import 'package:wuwu/styles/palette.dart';

/// 新建标签
class BSTagCreate extends StatelessWidget {
  const BSTagCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      // height: Get.height / 2,
      decoration: const BoxDecoration(
        color: Palette.b30,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StyledText.JBMono('data'),
            InputBox(hintText: '请输入标签名'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: MyButtonStyle.cancel,
                      onPressed: Get.back,
                      child: const StyledText.XiaoBai(
                        '取消',
                        color: Palette.b90,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: MyButtonStyle.confirm,
                      onPressed: () {},
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
}
