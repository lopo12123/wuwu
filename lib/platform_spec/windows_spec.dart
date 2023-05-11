import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/styles/palette.dart';

/// windows 外应用外壳
class AppFrame extends StatelessWidget {
  final Widget app;

  const AppFrame({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [BoxShadow(color: Palette.b80, blurRadius: 1)],
      ),
      child: app,
    );
  }
}
