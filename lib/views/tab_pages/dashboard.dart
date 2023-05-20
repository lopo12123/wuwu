import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';

class _DashboardController extends GetxController {
  final RxInt val = 10.obs;
}

class DashboardPage extends GetView<_DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(_DashboardController());

    return Scaffold(
      appBar: const ToolBar(title: StyledText.XiaoBai('全览')),
      body: ListView(
        children: [
        ],
      ),
    );
  }
}
