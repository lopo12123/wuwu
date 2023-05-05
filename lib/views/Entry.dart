import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

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

            ],
          ),
        ),
      ),
    );
  }
}
