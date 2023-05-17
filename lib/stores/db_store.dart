import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wuwu/misc/result.dart';
import 'package:wuwu/stores/collections/tag.dart';
import 'package:wuwu/utils/safe_print.dart';

abstract class DBStoreImpl {
  // region 标签
  /// 增加标签
  static Future addTag(Tag tag) async {
    if (_handle == null) return Result.err('数据库初始化失败');

    await _handle!.writeTxn(() async {
      tag.createTime = DateTime.now();
      await _handle!.tags.put(tag);
    });
  }

  /// 获取所有标签
  static Future<Result<List<Tag>, String>> getAllTags() async {
    if (_handle == null) return Result.err('数据库初始化失败');

    var r = await _handle!.tags.where().sortByCreateTime().findAll();

    return Result.ok(r);
  }

  // endregion

  // region lifecycle
  static Future<void> init() async {
    if (_handle?.isOpen == true) {
      SafePrint.info('[DBStoreImpl] re-init (skip)');
      return;
    }

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
    _handle = isar;
  }

  static Future<void> dispose() async {
    bool? r = await _handle?.close();
    SafePrint.info('[DBStoreImpl] close: $r');
  }

  // endregion

  static Isar? _handle;
}
