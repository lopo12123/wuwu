import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/search_box_debounce.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/stores/collections/tag.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/safe_print.dart';

class _TagItem extends StatelessWidget {
  final Tag tag;

  const _TagItem({required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Palette.b20,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: Color(tag.colorHex ?? Palette.blue.value),
          ),
          Expanded(
            child: StyledText.ShouShu(
              tag.tagName ?? '???',
              fontSize: 14,
            ).paddingSymmetric(horizontal: 8),
          ),
          StyledText.JBMono(
            tag.createTime?.toString().substring(0, 16) ?? '--',
            color: Palette.b60,
            fontSize: 12,
          )
        ],
      ),
    );
  }
}

class _TagManageController extends GetxController {
  List<Tag> get tags => GlobalStoreImpl.store.tags;

  Future<void> syncTags([bool toast = true]) async {
    await GlobalStoreImpl.store.init(toast: toast, tag: true);
  }

  @override
  void onInit() {
    super.onInit();

    syncTags(false);
  }
}

class TagManageView extends GetView<_TagManageController> {
  const TagManageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(_TagManageController());

    return Scaffold(
        appBar: const ToolBar(
          title: StyledText.ShouShu('标签管理'),
        ),
        body: Column(
          children: [
            SearchBoxDebounce(onConfirmed: (str) {
              SafePrint.info(str);
            }),
            Expanded(
              child: RefreshIndicator(
                onRefresh: controller.syncTags,
                child: Obx(
                  () => ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    children: controller.tags.map((tag) {
                      return _TagItem(tag: tag);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
