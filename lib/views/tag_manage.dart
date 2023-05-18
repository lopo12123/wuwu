import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/search_box_debounce.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/empty_list.dart';
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
  /// 展示的标签列表
  RxList<Tag> tagList = <Tag>[].obs;

  /// 从数据库获取最新的标签列表
  Future<void> syncTags([bool toast = true]) async {
    await GlobalStoreImpl.store.init(toast: toast, tag: true);
    tagList(GlobalStoreImpl.store.tags);
  }

  /// 搜索标签
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

  /// 打开新建标签的交互
  void requestTagCreate() {
    // todo
    SafePrint.info('requestTagCreate');
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
                hintText: '输入标签名以查找',
                onConfirmed: controller.searchTags,
              ),
              IconButton(
                iconSize: 32,
                padding: const EdgeInsets.only(left: 16),
                onPressed: controller.requestTagCreate,
                icon: const Icon(Icons.bookmark_add, color: Palette.b70),
              ),
            ],
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.syncTags,
              child: Obx(
                () => controller.tagList.isEmpty
                    ? emptyListPlaceholder(color: Palette.b50)
                    : ListView(
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
