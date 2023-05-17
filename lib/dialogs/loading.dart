import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/styles/palette.dart';

/// 加载状态占位图像
final Widget loadingCover = Container(
  width: 108,
  height: 108,
  decoration: BoxDecoration(
    color: Palette.b80.withOpacity(0.97),
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      LoadingAnimationWidget.fallingDot(color: Palette.b00, size: 50),
      const SizedBox(height: 9),
      const StyledText.JBMono('loading...', color: Palette.b00, fontSize: 13)
    ],
  ),
);

/// loading 遮罩
///
/// 背景色为 Get.dialog 的默认遮罩色 (`Colors.black54` `0x8a000000`)
class LoadingDialog extends StatelessWidget {
  final bool canBack;

  const LoadingDialog({super.key, this.canBack = false});

  static void show([bool dismissible = true]) {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: dismissible,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration.zero,
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Palette.transparent,
      child: UnconstrainedBox(child: loadingCover),
    );
  }
}
