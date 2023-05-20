import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/clickable.dart';
import 'package:wuwu/components/common/input_box.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/views/bottom_sheet/bs_base.dart';

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
    return bsBase(
      title: '新建标签',
      onCancel: Get.back,
      onConfirm: () => Get.back(result: {
        'tagName': tagName.value,
        'tagColor': tagColorValue.value,
      }),
      children: [
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
      ],
    );
  }
}
