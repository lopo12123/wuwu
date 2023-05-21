import 'package:flutter/material.dart';
import 'package:wuwu/components/graph_password.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';

class PathLockView extends StatelessWidget {
  const PathLockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(
        leading: Icon(Icons.lock_outline),
        title: StyledText.XiaoBai('手势密码'),
      ),
      body: Center(
        child: GraphPassword(
          onComplete: (answer) {},
        ),
      ),
    );
  }
}
