import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/safe_print.dart';
import 'package:wuwu/views/tab_pages/dashboard.dart';
import 'package:wuwu/views/tab_pages/home.dart';

class _EntryController extends GetxController {
  final PageController pc = PageController(initialPage: 1);
}

class EntryView extends GetView<_EntryController> {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(_EntryController());

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        color: Palette.yellow,
        buttonBackgroundColor: Palette.green,
        backgroundColor: Palette.transparent,
        onTap: (v) => controller.pc.jumpToPage(v),
        items: const [
          Icon(Icons.manage_search_outlined, color: Palette.b00, size: 32),
          Icon(Icons.roofing_outlined, color: Palette.b00, size: 32),
          Icon(Icons.tune_outlined, color: Palette.b00, size: 32),
        ],
      ),
      body: PageView(
        controller: controller.pc,
        onPageChanged: (v) {
          // todo: test on android device.
          SafePrint.info('onPageChanged: $v');
        },
        children: [
          const DashboardPage(),
          const HomePage(),
          Container(color: Palette.red),
        ],
      ),
    );
  }
}
