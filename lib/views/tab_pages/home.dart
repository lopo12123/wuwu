import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/nice_clock.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/routes/index.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/my_toast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(),
      body: Column(
        children: [
          niceClock.paddingSymmetric(vertical: 16),
          const Divider(height: 1, thickness: 1, color: Palette.b30),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                StyledText.ShouShu('最近 n 笔消费'),
                StyledText.ShouShu('最近 n 笔消费'),
                StyledText.ShouShu('最近 n 笔消费'),
                StyledText.ShouShu('最近 n 笔消费'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
