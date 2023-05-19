import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/nice_clock.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/routes/index.dart';
import 'package:wuwu/utils/my_toast.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        title: const StyledText.XiaoBai('全览'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(MyRoutes.tag_manage),
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
    );
  }
}
