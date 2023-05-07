import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/components/tool_bar.dart';
import 'package:wuwu/dialogs/base.dart';
import 'package:wuwu/dialogs/loading.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/safe_print.dart';

class EntryView extends StatelessWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.dialog(
                BaseDialog(
                  contentText: 'contentText',
                  onCancel: () {},
                  onConfirm: () {},
                ),
              );
            },
            child: StyledText.JBMono('base'),
          ),
          ElevatedButton(
            onPressed: () {
              LoadingDialog.show();
            },
            child: StyledText.JBMono('loading'),
          ),
        ],
      ),
    );
  }
}
