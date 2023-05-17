import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/stores/collections/tag.dart';
import 'package:wuwu/stores/db_store.dart';

class _TagManageController extends GetxController {
  final RxList<Tag> tags = <Tag>[].obs;

  Future<void> syncTags() async {}
}

class TagManageView extends GetView<_TagManageController> {
  const TagManageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(_TagManageController());

    return Scaffold(
      appBar: ToolBar(
        title: StyledText.ZhuoKai('标签管理'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              DBStoreImpl.getAllTags();
            },
            child: StyledText.ZhuoKai('getTags'),
          ),
        ],
      ),
    );
  }
}
