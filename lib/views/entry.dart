import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/utils/safe_print.dart';

class EntryView extends StatelessWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanStart: (details) {
            windowManager.startDragging();
          },
          child: AppBar(
            title: Text('w: ${Get.width} h: ${Get.height}'),
            actions: [
              IconButton(
                onPressed: () {
                  windowManager.close();
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: StyledText.JBMono('nonce'),
          ),
        ],
      ),
    );
  }
}
