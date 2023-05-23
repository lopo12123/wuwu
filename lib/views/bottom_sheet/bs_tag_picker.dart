import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/routes/index.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/stores/isar/tag.dart';
import 'package:wuwu/styles/button.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/views/bottom_sheet/bs_base.dart';

class BSTagPicker extends StatelessWidget {
  /// 全部的可用标签
  List<Tag> get allTags => GlobalStoreImpl.store.tags;

  final RxSet<int> tags;

  BSTagPicker({super.key, Set<int> initialTags = const {}})
      : tags = initialTags.obs;

  @override
  Widget build(BuildContext context) {
    return bsBase(
      title: '标签选择',
      onCancel: Get.back,
      onConfirm: () => Get.back(result: tags.toSet()),
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Obx(
              () => allTags.isEmpty
                  ? ElevatedButton(
                      style: MyButtonStyle.toCreate,
                      onPressed: () => Get.toNamed(MyRoutes.tag_manage),
                      child: const StyledText.ShouShu(
                        '暂无标签, 前往创建',
                        color: Palette.b60,
                      ),
                    )
                  : Text.rich(
                      TextSpan(
                        children: allTags.map((tag) {
                          bool isSelected = tags.contains(tag.id);

                          return WidgetSpan(
                            child: ElevatedButton.icon(
                              style: isSelected
                                  ? MyButtonStyle.tagActive
                                  : MyButtonStyle.tagInactive,
                              onPressed: () => isSelected
                                  ? tags.remove(tag.id)
                                  : tags.add(tag.id),
                              icon: CircleAvatar(
                                radius: 8,
                                backgroundColor:
                                    Color(tag.colorHex ?? Palette.b20.value),
                              ),
                              label: StyledText.ShouShu(
                                tag.tagName ?? '',
                                color: isSelected ? Palette.lemon : Palette.b90,
                              ),
                            ).paddingAll(4),
                          );
                        }).toList(),
                      ),
                    ),
            ),
          ).paddingAll(12),
        ),
      ],
    );
  }
}
