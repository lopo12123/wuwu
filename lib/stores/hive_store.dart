import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wuwu/utils/safe_print.dart';

abstract class HiveStoreImpl {
  // region lifecycle
  static Future<void> init() async {
    if (_handle?.isOpen == true) {
      SafePrint.info('[HiveStoreImpl] re-init (skip)');
      return;
    }

    // todo: test on android
    final docDir = await getApplicationDocumentsDirectory();
    final appDir = Directory('${docDir.path}${Platform.pathSeparator}wuwu');

    if (!appDir.existsSync()) {
      appDir.createSync();
      SafePrint.info('[DBStoreImpl] create store directory (cause not exist)');
    }

    final cfgBox = await (Hive..init(appDir.path)).openBox('appCfg');
    _handle = cfgBox;
  }

  // endregion

  static dynamic _handle;
}
