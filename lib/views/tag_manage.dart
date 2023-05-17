import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/stores/collections/tag.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/styles/palette.dart';

class _TagItem extends StatelessWidget {
  final Tag tag;

  const _TagItem({required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: Palette.b20,
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(tag.colorHex ?? Palette.blue.value),
          ),
          Expanded(
            child: StyledText.ZhuoKai(tag.tagName ?? '???')
                .paddingSymmetric(horizontal: 8),
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
        title: StyledText.ZhuoKai('标签管理'),
      ),
      body: RefreshIndicator(
        onRefresh: controller.syncTags,
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              ...controller.tags.map((tag) {
                return _TagItem(tag: tag);
              }),
              ElevatedButton(
                onPressed: () {
                  GlobalStoreImpl.store.addTag(Tag()
                    ..tagName = 'ElevatedButton'
                    ..colorHex = Palette.yellow.value);
                },
                child: StyledText.ZhuoKai('添加标签'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
