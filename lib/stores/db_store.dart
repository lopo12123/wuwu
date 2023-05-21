import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wuwu/stores/isar/tag.dart';
import 'package:wuwu/utils/safe_print.dart';

abstract class DBStoreImpl {
  // region 标签
  /// 增加标签
  static Future<void> addTag(Tag tag) async {
    await requireInitialized();

    tag.createTime ??= DateTime.now();
    await _handle!.writeTxn(() async {
      await _handle!.tags.put(tag);
    });
  }

  /// 删除标签
  static Future deleteTag(Id tagId) async {
    await requireInitialized();

    await _handle!.writeTxn(() async {
      await _handle!.tags.delete(tagId);
    });
  }

  /// 获取所有标签
  static Future<List<Tag>> getAllTags() async {
    await requireInitialized();

    return await _handle!.tags.where().sortByCreateTime().findAll();
  }

  // endregion

  // region lifecycle
  /// 确保已初始化
  static Future<void> requireInitialized() async {
    if (_handle == null) await init();
  }

  /// 初始化
  static Future<void> init() async {
    if (_handle?.isOpen == true) {
      SafePrint.info('[DBStoreImpl] re-init (skip)');
      return;
    }

    // todo: test on android
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

  /// 注销
  static Future<void> dispose() async {
    bool? r = await _handle?.close();
    SafePrint.info('[DBStoreImpl] closed($r)');
  }

  // endregion

  static Isar? _handle;
}
