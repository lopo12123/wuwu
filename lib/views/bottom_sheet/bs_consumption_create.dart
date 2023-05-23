import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/input_box.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/tag_label.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/stores/isar/consumption.dart';
import 'package:wuwu/stores/isar/tag.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/my_toast.dart';
import 'package:wuwu/views/bottom_sheet/bs_base.dart';
import 'package:wuwu/views/bottom_sheet/bs_tag_picker.dart';

class _BSConsumptionCreateController extends GetxController {
  /// 全部的可用标签
  List<Tag> get allTags => GlobalStoreImpl.store.tags;

  Iterable<Tag> get selectedTags =>
      allTags.where((tag) => tags.contains(tag.id));

  final RxBool income = false.obs;
  final RxDouble amount = (-1.0).obs;
  final RxString desc = ''.obs;
  final RxSet<int> tags = <int>{}.obs;

  Future<void> pickTag() async {
    Set<int>? tagIds = await Get.bottomSheet(
      BSTagPicker(initialTags: tags.toSet()),
    );

    if (tagIds != null) tags(tagIds);
  }

  void submitForm() {
    if (amount.value == -1) {
      MyToast.warn('请输入金额');
    } else {
      Get.back(
        result: Consumption()
          ..income = income.value
          ..amount = amount.value
          ..desc = desc.value
          ..tags = tags.toList(),
      );
    }
  }
}

class BSConsumptionCreate extends GetView<_BSConsumptionCreateController> {
  const BSConsumptionCreate({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(_BSConsumptionCreateController());

    return bsBase(
      title: '新增记录',
      onCancel: Get.back,
      onConfirm: controller.submitForm,
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
        Row(
          children: [
            const StyledText.XiaoBai('标签:', fontSize: 22)
                .paddingOnly(right: 16),
            Expanded(
              child: Obx(
                () => controller.tags.isEmpty
                    ? const StyledText.ShouShu(
                        '暂无标签',
                        color: Palette.b50,
                        fontSize: 16,
                      )
                    : SizedBox(
                        height: 30,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: controller.selectedTags
                              .map(
                                (tag) => tagLabel(
                                  tag: tag,
                                  margin: const EdgeInsets.only(right: 8),
                                ),
                              )
                              .toList(),
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(30),
                backgroundColor: Palette.b00,
                disabledBackgroundColor: Palette.b00,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.5, color: Palette.b40),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: controller.pickTag,
              child: const StyledText.ShouShu('选择', color: Palette.b90),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
        const SizedBox(height: 16),
      ],
    );
  }
}
