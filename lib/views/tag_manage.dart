import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';

class TagManageView extends GetView {
  const TagManageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        title: StyledText.ZhuoKai('标签管理'),
      ),
    );
  }
}
