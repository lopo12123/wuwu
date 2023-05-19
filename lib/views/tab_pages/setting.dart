import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/nice_clock.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/routes/index.dart';
import 'package:wuwu/utils/my_toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: const StyledText.XiaoBai('设置')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            niceClock,
            ElevatedButton(
              onPressed: () => MyToast.success('ok可以'),
              child: StyledText.JBMono('toast'),
            ),
            // ElevatedButton(
            //   onPressed: () => Get.toNamed(MyRoutes.db_viewer),
            //   child: StyledText.JBMono('to db_viewer'),
            // ),
            // ElevatedButton(
            //   onPressed: () => Get.toNamed(MyRoutes.path_lock),
            //   child: StyledText.JBMono('to path_lock'),
            // ),
          ],
        ),
      ),
    );
  }
}
