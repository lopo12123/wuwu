import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/stores/db_store.dart';

class DBViewerView extends GetView {
  const DBViewerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        title: StyledText.ZhuoKai('DB Viewer'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              DBStoreImpl.init();
            },
            child: StyledText.ZhuoKai('init'),
          ),
          ElevatedButton(
            onPressed: () {
              DBStoreImpl.dispose();
            },
            child: StyledText.ZhuoKai('dispose'),
          ),
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
