import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/input_box.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/stores/isar/tag.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/views/bottom_sheet/bs_base.dart';

class _BSConsumptionCreateController extends GetxController {
  /// 全部的可用标签
  List<Tag> get allTags => GlobalStoreImpl.store.tags;

  final RxBool income = false.obs;
  final RxDouble amount = 0.0.obs;
  final RxString desc = ''.obs;
  final RxSet<int> tags = <int>{}.obs;
}

class BSConsumptionCreate extends GetView<_BSConsumptionCreateController> {
  const BSConsumptionCreate({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(_BSConsumptionCreateController());

    return bsBase(
      title: '新增记录',
      children: [
        Obx(
          () => Row(
            children: [
              const StyledText.XiaoBai('类型:', fontSize: 22)
                  .paddingOnly(right: 16),
              TextButton(
                onPressed: () => controller.income(true),
                child: StyledText.ShouShu(
                  '收入',
                  color: Palette.purple,
                  fontSize: controller.income.isTrue ? 20 : 16,
                  underline: controller.income.isTrue,
                ),
              ),
              TextButton(
                onPressed: () => controller.income(false),
                child: StyledText.ShouShu(
                  '支出',
                  color: Palette.purple,
                  fontSize: controller.income.isFalse ? 20 : 16,
                  underline: controller.income.isFalse,
                ),
              ),
            ],
          ),
        ).paddingAll(16),
        Row(
          children: [
            const StyledText.XiaoBai('金额:', fontSize: 22)
                .paddingOnly(right: 16),
            Expanded(
              child: InputBox(
                hintText: '请输入金额',
                numberType: true,
                onChanged: (val) {
                  controller.amount(double.tryParse(val) ?? 0);
                },
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StyledText.XiaoBai('描述:', fontSize: 22)
                .paddingOnly(right: 16),
            Expanded(
              child: InputBox(
                hintText: '描述（可选）',
                lines: 2,
                onChanged: (val) {
                  controller.amount(double.tryParse(val) ?? 0);
                },
              ),
            ),
          ],
        ).paddingAll(16),
        // todo: 标签列表选择
        Row()
      ],
    );
  }
}
