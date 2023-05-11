import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_single_instance/windows_single_instance.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/safe_print.dart';

/// windows 平台特定
abstract class _WindowsSpec {
  /// 配置窗口初始数据
  static Future<void> _setupWindowCfg() async {
    await windowManager.ensureInitialized();

    WindowOptions cfg = const WindowOptions(
      size: Size(390, 800),
      center: true,
      backgroundColor: Palette.transparent,
      titleBarStyle: TitleBarStyle.hidden,
    );

    windowManager.waitUntilReadyToShow(cfg, () async {
      await windowManager.setAsFrameless();
      await windowManager.show();
      await windowManager.focus();
    });
  }

  /// 确保单实例运行
  static Future<void> _setupSingleTonCfg(List<String> args) async {
    await WindowsSingleInstance.ensureSingleInstance(
      args,
      'wuwu',
      onSecondWindow: (args) async {
        // 唤起并聚焦
        if (await windowManager.isMinimized()) await windowManager.restore();
        windowManager.focus();
      },
    );
  }

  /// 平台初始化
  static Future<void> init(List<String> args) async {
    await _setupWindowCfg();
    await _setupSingleTonCfg(args);
  }
}

/// android 平台特定
abstract class _AndroidSpec {
  /// 平台初始化
  static Future<void> init(List<String> args) {
    // TODO: implement prelude
    throw UnimplementedError();
  }
}

/// 多平台抽象
abstract class PlatformSpec {
  static final isWin = Platform.isWindows;

  static final isAndroid = Platform.isAndroid;

  /// 应用运行前调用, 针对平台初始化
  static Future<void> init(List<String> args) async {
    SafePrint.info('[PlatformSpec] init -- start');

    if (isWin) {
      await _WindowsSpec.init(args);
      SafePrint.info('[PlatformSpec] init -- windows');
    } else if (isAndroid) {
      // await _AndroidSpec.init()
      SafePrint.info('[PlatformSpec] init -- android (skip)');
    }

    SafePrint.info('[PlatformSpec] init -- end');
  }
}
