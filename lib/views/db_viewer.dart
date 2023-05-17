import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/stores/db_store.dart';

class DBViewerView extends GetView {
  const DBViewerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        title: StyledText.ShouShu('DB Viewer'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              DBStoreImpl.init();
            },
            child: StyledText.ShouShu('init'),
          ),
          ElevatedButton(
            onPressed: () {
              DBStoreImpl.dispose();
            },
            child: StyledText.ShouShu('dispose'),
          ),
          ElevatedButton(
            onPressed: () {
              DBStoreImpl.getAllTags();
            },
            child: StyledText.ShouShu('getTags'),
          ),
        ],
      ),
    );
  }
}
