import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/nice_clock.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/styles/palette.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(extraActions: true),
      body: Column(
        children: [
          niceClock.paddingSymmetric(vertical: 32),
          const Divider(height: 1, thickness: 1),
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
