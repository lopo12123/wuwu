import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/search_box_debounce.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/slidable_widget.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/stores/collections/tag.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/my_toast.dart';
import 'package:wuwu/utils/safe_print.dart';

class _TagItem extends StatelessWidget {
  final Tag tag;

  const _TagItem({required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
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
              tag.tagName ?? '<暂无标签名>',
              fontSize: 16,
              lineHeight: 24,
              fontWeight: FontWeight.w500,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).paddingSymmetric(horizontal: 8),
          ),
          StyledText.JBMono(
            tag.createTime?.toString().substring(0, 16) ?? '<unknown date>',
            color: Palette.b60,
            fontSize: 12,
          )
        ],
      ),
    );
  }
}

class _TagManageController extends GetxController {
  RxList<Tag> tagList = <Tag>[].obs;

  Future<void> syncTags([bool toast = true]) async {
    await GlobalStoreImpl.store.init(toast: toast, tag: true);
    tagList(GlobalStoreImpl.store.tags);
  }

  Future<void> searchTags(String part) async {
    if (part.isEmpty) {
      syncTags(false);
    } else {
      List<Tag> filtered = GlobalStoreImpl.store.tags
          .where((tag) => tag.tagName?.contains(part) ?? false)
          .toList();
      tagList(filtered);
    }
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
      appBar: const ToolBar(title: StyledText.XiaoBai('标签管理')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchBoxDebounce(
                hintText: '输入标签名开始查找',
                onConfirmed: controller.searchTags,
              ),
              // todo
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  SafePrint.info('创建标签');
                },
              ),
            ],
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.syncTags,
              child: Obx(
                () => ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  children: controller.tagList.map((tag) {
                    return slidableTagItem(
                      onEdit: () {
                        MyToast.warn('暂不支持');
                      },
                      onDelete: () async {
                        await GlobalStoreImpl.store.deleteTag(tag.id);
                        MyToast.success('标签已删除');
                      },
                      child: _TagItem(tag: tag),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
