import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wuwu/stores/collections/tag.dart';
import 'package:wuwu/utils/safe_print.dart';

abstract class DBStoreImpl {
  static Isar? handle;

  static Future<void> init() async {
    final docDir = await getApplicationDocumentsDirectory();
    final appDir = Directory('${docDir.path}${Platform.pathSeparator}wuwu');

    if (!appDir.existsSync()) {
      appDir.createSync();
      SafePrint.info('[DBStoreImpl] create store directory (cause not exist)');
    }

    final isar = await Isar.open(
      [TagSchema],
      name: 'store',
      directory: appDir.path,
    );
    handle = isar;
  }

  static Future<void> dispose() async {
    bool? r = await handle?.close();
    SafePrint.info('[DBStoreImpl] close: $r');
  }
}
