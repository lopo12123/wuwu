import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/clickable.dart';
import 'package:wuwu/components/common/input_box.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/styles/button.dart';
import 'package:wuwu/styles/palette.dart';

/// 标签的可选颜色
const List<Color> tagColorList = [
  Palette.blue,
  Palette.red,
  Palette.yellow,
  Palette.green,
  Palette.purple,
];

/// 新建标签
///
/// { 'tagName': string, 'tagColorValue': string }
class BSTagCreate extends StatelessWidget {
  final RxString tagName = ''.obs;
  final RxInt tagColorValue = Palette.blue.value.obs;

  BSTagCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: Palette.b00,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const StyledText.XiaoBai('新建标签', fontSize: 22)
                .paddingSymmetric(vertical: 8),
            const Divider(height: 1, thickness: 1, color: Palette.b30),
            InputBox(
              autoFocus: true,
              hintText: '请输入标签名',
              onChanged: (s) => tagName(s),
            ).paddingAll(16),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const StyledText.XiaoBai('选择标签颜色:', fontSize: 18),
                  ...tagColorList.map((color) {
                    bool isSelected = tagColorValue.value == color.value;

                    return Clickable.custom(
                      CircleAvatar(
                        radius: isSelected ? 12 : 10,
                        backgroundColor: color,
                        child: isSelected
                            ? const Icon(
                                Icons.check,
                                size: 18,
                                color: Palette.b00,
                              )
                            : null,
                      ),
                      onClick: () => tagColorValue(color.value),
                    );
                  }),
                ],
              ),
            ).paddingSymmetric(horizontal: 16),
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
                      onPressed: () => Get.back(result: {
                        'tagName': tagName.value,
                        'tagColor': tagColorValue.value,
                      }),
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
