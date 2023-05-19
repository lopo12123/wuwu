import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/nice_clock.dart';
import 'package:wuwu/components/setting_item.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/routes/index.dart';
import 'package:wuwu/styles/palette.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ToolBar(title: StyledText.XiaoBai('设置')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SettingItem(
              text: '标签管理',
              icon: const Icon(Icons.style_outlined, color: Palette.purple),
              suffix: const Icon(Icons.arrow_right, color: Palette.b50),
              onPressed: () => Get.toNamed(MyRoutes.tag_manage),
            ),
          ],
        ));
  }
}
