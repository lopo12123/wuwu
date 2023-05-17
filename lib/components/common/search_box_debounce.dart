import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/styles/palette.dart';

/// 搜索输入框状态
class _SearchBoxDebounceController extends GetxController {
  /// 输入监听器
  Worker? observer;

  final RxString text = ''.obs;

  void observe(void Function(String str) onEnd) {
    if (observer != null) return;

    observer = debounce(text, onEnd);
  }

  @override
  void onClose() {
    observer?.dispose();
    observer = null;

    super.onClose();
  }
}

/// 搜索输入框
class SearchBoxDebounce extends GetView<_SearchBoxDebounceController> {
  /// 确认按钮 (不处理空字符串)
  final void Function(String str) onConfirmed;

  /// 空白占位文本
  final String? hintText;

  /// 可选的tag, 当同一时间出现多个此组件时必需
  final String? optionalTag;

  @override
  String? get tag => optionalTag;

  const SearchBoxDebounce({
    super.key,
    required this.onConfirmed,
    this.hintText,
    this.optionalTag,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(_SearchBoxDebounceController(), tag: optionalTag)
        .observe(onConfirmed);

    return Container(
      width: 260,
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.b70),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_outlined, color: Palette.b50)
              .paddingOnly(right: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(color: Palette.b50, fontSize: 14),
              ),
              style: const TextStyle(color: Palette.b90, fontSize: 14),
              onTapOutside: (pEv) {
                // 点击外部自动失去焦点
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onChanged: (str) => controller.text(str),
            ),
          ),
        ],
      ),
    );
  }
}
