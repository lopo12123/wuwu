import 'package:flutter/material.dart';
import 'package:gesture_password_widget/gesture_password_widget.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/graph_password.dart';
import 'package:wuwu/components/setting_item.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/routes/index.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/safe_print.dart';
import 'package:wuwu/views/bottom_sheet/bs_gesture_psw.dart';
import 'package:wuwu/views/bottom_sheet/bs_home_setting.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(title: StyledText.XiaoBai('设置')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        children: [
          SettingItem(
            text: '首页设置',
            icon: const Icon(Icons.list, color: Palette.purple),
            suffix: const Icon(Icons.arrow_right, color: Palette.b50),
            onPressed: () => Get.bottomSheet(const BSHomeSetting()),
          ),
          const SizedBox(height: 16),
          SettingItem(
            text: '标签管理',
            icon: const Icon(Icons.style_outlined, color: Palette.purple),
            suffix: const Icon(Icons.arrow_right, color: Palette.b50),
            onPressed: () => Get.toNamed(MyRoutes.tag_manage),
          ),
          const SizedBox(height: 16),
          SettingItem(
            text: '手势密码',
            icon: const Icon(Icons.fingerprint_outlined, color: Palette.purple),
            suffix: const Icon(Icons.arrow_right, color: Palette.b50),
            onPressed: () => Get.bottomSheet(const BSGesturePsw()),
          ),
          // Container(
          //   child: Center(
          //     child: GraphPassword(
          //       onComplete: (answer) {
          //         SafePrint.info('input: $answer');
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
