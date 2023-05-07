import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/styles/palette.dart';

abstract class _Cfg {
  /// 数字块大小
  static const double numBlockSize = 40.0;

  /// 数字列间距
  static const double numBlockGap = 8;

  /// 数字列空白大小
  static const double numBlockPlaceholder = 24;

  /// 默认 -- 数字大小
  static const double inactiveFontSize = 14.0;

  /// 选中 -- 数字大小
  static const double activeFontSize = 18.0;

  /// 默认 -- 背景色
  static const Color inactiveBgColor = Palette.yellow;

  /// 选中 -- 背景色
  static const Color activeBgColor = Palette.purple;
}

final Widget prefix = Container(
  width: _Cfg.numBlockSize,
  height: _Cfg.numBlockSize / 2 - 1,
  margin: const EdgeInsets.only(bottom: 1),
  decoration: const BoxDecoration(
    color: _Cfg.inactiveBgColor,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(_Cfg.numBlockSize / 2),
    ),
  ),
);

final Widget suffix = Container(
  width: _Cfg.numBlockSize,
  height: _Cfg.numBlockSize / 2,
  decoration: const BoxDecoration(
    color: _Cfg.inactiveBgColor,
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(_Cfg.numBlockSize / 2),
    ),
  ),
);

Widget _numBlock(int val, bool isActive) {
  return Container(
    width: _Cfg.numBlockSize,
    height: _Cfg.numBlockSize - 1,
    margin: const EdgeInsets.only(bottom: 1),
    alignment: Alignment.center,
    color: isActive ? _Cfg.activeBgColor : _Cfg.inactiveBgColor,
    child: StyledText.JBMono(
      '$val',
      color: !isActive ? _Cfg.activeBgColor : _Cfg.inactiveBgColor,
      fontSize: isActive ? _Cfg.activeFontSize : _Cfg.inactiveFontSize,
    ),
  );
}

Widget _numberList(int max, int curr) {
  final l = List.generate(max + 1, (idx) => _numBlock(idx, idx == curr));

  l.insert(0, prefix);
  l.add(suffix);

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: _Cfg.numBlockGap / 2),
    child: Align(
        alignment: Alignment.topCenter,
        widthFactor: 1,
        heightFactor: (curr * 2 + 1) / max + 1,
        child: SizedBox(
          height: (max + 2) * _Cfg.numBlockSize,
          child: Column(
            children: l,
          ),
        )),
  );
}

class _NiceClockController extends GetxController {
  final Rx<DateTime> tNow = DateTime.now().obs;

  int get hh => tNow.value.hour ~/ 10;

  int get hl => tNow.value.hour % 10;

  int get mh => tNow.value.minute ~/ 10;

  int get ml => tNow.value.minute % 10;

  int get sh => tNow.value.second ~/ 10;

  int get sl => tNow.value.second % 10;

  Timer? timerId;

  @override
  void onReady() {
    super.onReady();

    timerId = Timer.periodic(const Duration(seconds: 1), (timer) {
      tNow(DateTime.now());
    });
  }

  @override
  void onClose() {
    timerId?.cancel();

    super.onClose();
  }
}

class NiceClock extends GetView<_NiceClockController> {
  const NiceClock({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(_NiceClockController());

    return Container(
      color: Palette.blue,
      // height: 13 * 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => _numberList(2, controller.hh)),
          Obx(() => _numberList(9, controller.hl)),
          const SizedBox(width: _Cfg.numBlockPlaceholder),
          Obx(() => _numberList(5, controller.mh)),
          Obx(() => _numberList(9, controller.ml)),
          const SizedBox(width: _Cfg.numBlockPlaceholder),
          Obx(() => _numberList(5, controller.sh)),
          Obx(() => _numberList(9, controller.sl)),
        ],
      ),
    );
  }
}
